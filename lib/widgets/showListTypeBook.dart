import 'package:flutter/material.dart';
import 'package:manager_library/widgets/addTypeBook.dart';
import 'package:provider/provider.dart';
import 'package:manager_library/models/RoomTypeBook.dart';
import 'roomManager.dart';

class ShowListTypeBook extends StatelessWidget {

  final List<RoomTypeBook> listRoomTypeBook;
  ShowListTypeBook(this.listRoomTypeBook);

  @override
  Widget build(BuildContext context) {
    RoomManager roomMangerBook = Provider.of<RoomManager>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: listRoomTypeBook.length,
            itemBuilder: (BuildContext context, int index) {
              RoomTypeBook b = listRoomTypeBook[index];
              return buildRoomCard(context, b);
            },
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(300, 745, 0, 0),
                    items: [
                      PopupMenuItem(
                        child: Material(
                          child: ElevatedButton(
                            onPressed: () {
                              FormAddTypeBook adds = FormAddTypeBook(roomMangerBook.addRoomTypeBook);
                              adds.openshowDialog(context);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                SizedBox(width: 10.0),
                                Text('Add New Book Type'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                );
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRoomCard(BuildContext context, RoomTypeBook b) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              RoomManager roomMangerBook = Provider.of<RoomManager>(context, listen: true);
              return AlertDialog(
                title: Text("Delete"),
                content: Text("Are you sure ${b.name}"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      roomMangerBook.deleteTypeBook(b);
                      Navigator.pop(context);
                  },
                    child: Text("Delete"),
                  ),
                ],
              );
            },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.layers, size: 30,),
                Text(
                  '${b.name}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
