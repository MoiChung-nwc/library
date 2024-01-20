import 'package:flutter/material.dart';

class FormAddTypeBook extends StatelessWidget {

  final Function(String) addRoomTypeBook;
  final typeController = TextEditingController();

  FormAddTypeBook(this.addRoomTypeBook);

  bool validateInput() {
    return typeController.text.isEmpty;
  }

  void openshowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: AlertDialog(
            title: Text('Book Category'),
            contentPadding: EdgeInsets.all(16.0),
            content: Container(
              height: 130.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Genre'),
                    controller: typeController,
                  ),
                  TextButton(
                    child: Text('Add Room Type'),
                    onPressed: (){
                      if(validateInput()){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error!'),
                              content: Text('No Data! You need to enter data.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        addRoomTypeBook(typeController.text);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Add New Room Type'),
                              content: Text('Successfully!'),
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
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
