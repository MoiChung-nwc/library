import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:manager_library/models/RoomBook.dart';
import 'package:manager_library/models/RoomTypeBook.dart';
import 'package:manager_library/widgets/addBook.dart';
import 'package:manager_library/widgets/roomManager.dart';
import 'package:manager_library/widgets/BookDetails.dart';

class ShowListBook extends StatelessWidget {

  final List<RoomBook> listRoomBook;
  final List<RoomTypeBook> listRoomTypeBook;

  ShowListBook(
      this.listRoomBook,
      this.listRoomTypeBook
      );


  @override
  Widget build(BuildContext context) {
    RoomManager roomMangerBook = Provider.of<RoomManager>(context, listen: true);
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: listRoomBook.length,
          itemBuilder: (BuildContext context, int index) {
            RoomBook b = listRoomBook[index];
            return buildRoomCard(context, b);
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(300, 745, 0, 0),
            items: [
              PopupMenuItem(
                child: Material(
                  child: ElevatedButton(
                    onPressed: () {
                      FormAddBook add = FormAddBook(
                        roomMangerBook.addBook,
                        roomMangerBook.listRoomTypeBook,
                      );
                      add.openShowdialog(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 10.0),
                        Text('Add New Book'),
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
    );
  }

  Widget buildRoomCard(BuildContext context, RoomBook b) {
    Color cardColor = b.status ? Colors.grey.shade300 : Colors.white;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetails(b),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          color: cardColor,
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Icon(Icons.hotel, size: 32, color: Colors.blue,),
                  Text(
                    '${b.nameBook}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
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


