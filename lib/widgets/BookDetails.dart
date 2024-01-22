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
        RoomManager roomMangerBook =
        Provider.of<RoomManager>(context, listen: true);
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
    TextEditingController nameBookController =
    TextEditingController(text: book.nameBook.toString());
    TextEditingController idNameBookController =
    TextEditingController(text: book.idBook.toString());
    ValueNotifier<RoomTypeBook?> selectRoomTypeBook =
    ValueNotifier<RoomTypeBook?>(book.type);
    ValueNotifier<bool> selectStatus = ValueNotifier<bool>(book.status);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          RoomManager roomMangerBook =
          Provider.of<RoomManager>(context, listen: true);
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
                              items: roomMangerBook.listRoomTypeBook
                                  .map((RoomTypeBook type) {
                                return DropdownMenuItem<RoomTypeBook>(
                                  value: type,
                                  child: Text(type.name),
                                );
                              }).toList(),
                              onChanged: (RoomTypeBook? value) {
                                int selectIndex = roomMangerBook
                                    .listRoomTypeBook
                                    .indexOf(value!);
                                selectRoomTypeBook.value = roomMangerBook
                                    .listRoomTypeBook[selectIndex];
                              },
                            );
                          }),
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
                        title: Text('Đổi thành công'),
                        content: Text('Thành công'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text('Thoát'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Lưu'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Thoát'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    RoomManager roomMangerBook =
    Provider.of<RoomManager>(context, listen: true);
    return Consumer<UserInterface>(
      builder: (context, ui, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Chi tiết sách'),
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
                      title: Text(
                        'Tên sách',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${book.nameBook}',
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Icon(Icons.book, color: Colors.green,),
                    ),
                    ListTile(
                      title: Text(
                        'ID sách',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${book.idBook}',
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Icon(Icons.tag, color: Colors.redAccent,),
                    ),
                    ListTile(
                      title: Text(
                        'Kiểu sách',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${book.type?.name}',
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Icon(Icons.book_outlined, color: Colors.blue),
                    ),
                    ListTile(
                      title: Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${book.status}',
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Icon(Icons.info, color: Colors.deepOrange,),
                    ),
                    SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => _onPressedDelete(context),
                          icon: Row(
                            children: [
                              Icon(Icons.delete, size: 30, color: Colors.red,),
                              Text(
                                'Delete Book',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () => edit(context),
                            icon: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: 30, color: Colors.green,
                                ),
                                Text('Edit Room',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            )),
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
