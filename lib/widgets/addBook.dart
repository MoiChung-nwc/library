import 'package:flutter/material.dart';
import 'package:manager_library/models/RoomTypeBook.dart';
import 'package:provider/provider.dart';
import 'package:manager_library/widgets/roomManager.dart';

class FormAddBook extends StatelessWidget {

  final Function addBook;
  final List<RoomTypeBook> listRoomTypeBook;

  final nameBookController = TextEditingController();
  final idBookController = TextEditingController();
  final ValueNotifier<RoomTypeBook?> selectRoomTypeBook = ValueNotifier<RoomTypeBook?>(null);
  int? numberTypeController = 0;

  FormAddBook(
      this.addBook,
      this.listRoomTypeBook,
      );

  RoomTypeBook? firstRoomTypeBook;

  bool validateInput() {
    return nameBookController.text.isEmpty || idBookController.text.isEmpty;
  }

  void openShowdialog(BuildContext context) {
    firstRoomTypeBook = listRoomTypeBook.first;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          RoomManager roomMangerBook = Provider.of<RoomManager>(context, listen: true);
          return GestureDetector(
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: AlertDialog(
              title: Text('Add New Book'),
              contentPadding: EdgeInsets.all(16.0),
              content: Container(
                height: 300.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Name Book'),
                      controller: nameBookController,
                      keyboardType: TextInputType.text,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'ID Book'),
                      controller: idBookController,
                      keyboardType: TextInputType.number,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Type Book: '),
                        ValueListenableBuilder<RoomTypeBook?>(
                            valueListenable: selectRoomTypeBook,
                            builder: (context, value, child) {
                              return DropdownButton<RoomTypeBook>(
                                value: value ?? firstRoomTypeBook,
                                items: listRoomTypeBook.map((RoomTypeBook value) {
                                  return DropdownMenuItem<RoomTypeBook>(
                                    value: value,
                                    child: Text(value.name),
                                  );
                                }).toList(),
                                onChanged: (RoomTypeBook? value) {
                                  int selectIndex = listRoomTypeBook.indexOf(value!);
                                  numberTypeController = selectIndex;
                                  selectRoomTypeBook.value = listRoomTypeBook[selectIndex];
                                },
                              );
                            }
                        ),
                      ],
                    ),

                    TextButton(
                      child: Text('Add Book'),
                      onPressed: () {
                        if(validateInput()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        else {
                          addBook(
                            nameBookController.text, // Thay đổi ở đây
                            int.parse(idBookController.text),
                            numberTypeController,
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Add New Book'),
                                content: Text('Thành công'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).popUntil((route) => route.isFirst);
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
