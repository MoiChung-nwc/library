import 'package:flutter/material.dart';
import 'package:manager_library/models/RoomBook.dart';
import 'package:manager_library/models/RoomTypeBook.dart';
import 'package:manager_library/models/user_interface.dart';
import 'package:provider/provider.dart';
import 'roomManager.dart';

class BookDetails extends StatelessWidget {

  RoomBook book;
  BookDetails(this.book);

  void _onPressedDelete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          RoomManager roomMangerBook = Provider.of<RoomManager>(context, listen: true);
          return AlertDialog(
            title: Text("Confirm Delete"),
            content: Text("Delete the book ${book.nameBook}?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                  onPressed: () {
                    roomMangerBook.deleteBook(book);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("Delete"),
              ),
            ],
          );
        },
    );
  }

  void edit(BuildContext context) {

    TextEditingController nameBookController = TextEditingController(text: book.nameBook.toString());
    TextEditingController idNameBookController = TextEditingController(text: book.idBook.toString());
    ValueNotifier<RoomTypeBook?> selectRoomTypeBook = ValueNotifier<RoomTypeBook?>(book.type);
    ValueNotifier<bool> selectStatus = ValueNotifier<bool>(book.status);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          RoomManager roomMangerBook = Provider.of<RoomManager>(context, listen: true);
          return AlertDialog(
            title: Text('Edit Book'),
            content: Container(
              height: 300.0,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameBookController,
                    decoration: InputDecoration(labelText: 'Name Book'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: idNameBookController,
                    decoration: InputDecoration(labelText: 'ID Book'),
                    keyboardType: TextInputType.number,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Book Type:'),
                      ValueListenableBuilder<RoomTypeBook?>(
                          valueListenable: selectRoomTypeBook,
                          builder: (context, value, child) {
                            return DropdownButton<RoomTypeBook>(
                              value: selectRoomTypeBook.value,
                              items: roomMangerBook.listRoomTypeBook.map((RoomTypeBook type) {
                                return DropdownMenuItem<RoomTypeBook>(
                                  value: type,
                                  child: Text(type.name),
                                );
                              }).toList(),
                              onChanged: (RoomTypeBook? value) {
                                int selectIndex = roomMangerBook.listRoomTypeBook.indexOf(value!);
                                selectRoomTypeBook.value = roomMangerBook.listRoomTypeBook[selectIndex];
                              },
                            );
                          }
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status'),
                      ValueListenableBuilder<bool>(
                          valueListenable: selectStatus,
                          builder: (context, value, child) {
                            return ToggleButtons(
                              children: [
                                Text('True'),
                                Text('False'),
                              ],
                              isSelected: [value, !value],
                              onPressed: (int index) {
                                selectStatus.value = index == 0;
                              },
                            );
                          },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    String newNameBook = nameBookController.text;
                    int newIdBook = int.tryParse(idNameBookController.text) ?? 0;

                    RoomBook newBook = RoomBook(
                        nameBook: newNameBook,
                        idBook: newIdBook,
                        status: selectStatus.value,
                        type: selectRoomTypeBook.value!,
                    );

                    roomMangerBook.editBook(book, newBook);
                    roomMangerBook.dataChanged();
                    book = newBook;
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Done'),
                            content: Text('Successfully'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Close'),
                              ),
                            ],
                          );
                        },
                    );
                  },
                  child: Text('Save'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    RoomManager roomMangerBook = Provider.of<RoomManager>(context, listen: true);
    return Consumer<UserInterface>(
        builder: (context, ui, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Room Details'),
              backgroundColor: ui.appBarColor,
            ),
            body: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                    padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text('Name Book',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('${book.nameBook}',
                        style: TextStyle(fontSize: 16),
                        ),
                        leading: Icon(Icons.confirmation_number),
                      ),
                      ListTile(
                        title: Text('ID Book',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('${book.idBook}',
                          style: TextStyle(fontSize: 16),
                        ),
                        leading: Icon(Icons.layers),
                      ),
                      ListTile(
                        title: Text('Book Type',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('${book.type?.name}',
                          style: TextStyle(fontSize: 16),
                        ),
                        leading: Icon(Icons.hotel, color: Colors.blue),
                      ),
                      ListTile(
                        title: Text('Status',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('${book.status}',
                          style: TextStyle(fontSize: 16),
                        ),
                        leading: Icon(Icons.info),
                      ),
                      SizedBox(height: 50.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => _onPressedDelete(context),
                              icon: Row(
                                children: [
                                  Icon(Icons.delete, size: 30),
                                  Text('Delete Book',
                                    style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                          ),
                          IconButton(
                              onPressed: () => edit(context),
                              icon: Row(
                                children: [
                                  Icon(Icons.edit, size: 30,),
                                  Text('Edit Room', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold) )
                                ],
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}
