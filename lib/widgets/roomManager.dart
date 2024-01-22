import 'package:flutter/material.dart';
import 'package:manager_library/models/user_interface.dart';
import 'package:manager_library/widgets/showListBook.dart';
import 'package:manager_library/widgets/showListTypeBook.dart';
import 'package:provider/provider.dart';
import 'package:manager_library/models/RoomBook.dart';
import 'package:manager_library/models/RoomTypeBook.dart';

class RoomManager extends ChangeNotifier {
  final List<RoomTypeBook> _listRoomTypeBook = [
    RoomTypeBook(name: " Triết học"),
    RoomTypeBook(name: " Khoa học công nghệ"),
    RoomTypeBook(name: " Truyện tranh"),
  ];

  List<RoomTypeBook> get listRoomTypeBook => _listRoomTypeBook;

  set listRoomTypeBook(List<RoomTypeBook> newListRoomTypeBook) {
    _listRoomTypeBook.addAll(newListRoomTypeBook);
    notifyListeners();
  }

  addRoomTypeBook(String name) {
    final newRoomTypeBook = RoomTypeBook(name: name);
    _listRoomTypeBook.add(newRoomTypeBook);
    notifyListeners();
  }

  bool _showTrueStatus = true;
  bool _showFalseStatus = true;

  bool get showTrueStatus => _showTrueStatus;
  bool get showFalseStatus => _showFalseStatus;

  set showTrueStatus(bool value) {
    _showTrueStatus = value;
    notifyListeners();
  }

  set showFalseStatus(bool value) {
    _showFalseStatus = value;
    notifyListeners();
  }

  late final List<RoomBook> listRoomBook;

  RoomManager() {
    listRoomBook = [
      RoomBook(
          nameBook: 'Đắc Nhân Tâm',
          idBook: 123,
          status: true,
          type: listRoomTypeBook[2]),
      RoomBook(
          nameBook: 'Tutorial dart',
          idBook: 567,
          status: false,
          type: listRoomTypeBook[1]),
    ];
  }

  addBook(String nameBook, int idBook, int typeBook) {
    if (typeBook >= 0 && typeBook < listRoomTypeBook.length) {
      RoomTypeBook addType = listRoomTypeBook[typeBook];
      final newBook = RoomBook(
        nameBook: nameBook,
        idBook: idBook,
        status: false,
        type: addType,
      );
      listRoomBook.add(newBook);
      notifyListeners();
    } else {
      // Xử lý trường hợp typeBook vượt quá giới hạn.
    }
  }

  deleteBook(RoomBook book) {
    listRoomBook.remove(book);
    notifyListeners();
  }

  deleteTypeBook(RoomTypeBook roomtypeBook) {
    listRoomTypeBook.remove(roomtypeBook);
    notifyListeners();
  }

  editBook(RoomBook oldBook, RoomBook newBook) {
    int index = listRoomBook.indexOf(oldBook);
    if (index != -1) {
      listRoomBook[index] = newBook;
      notifyListeners();
    }
    notifyListeners();
  }

  void dataChanged() {
    notifyListeners();
  }
}

class RoomManagerBook extends StatelessWidget {
  const RoomManagerBook({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RoomManager(),
      child: RoomManagerWidget(),
    );
  }
}

class RoomManagerWidget extends StatefulWidget {
  @override
  State<RoomManagerWidget> createState() => _RoomManagerWidgetState();
}

class _RoomManagerWidgetState extends State<RoomManagerWidget> {
  List<String> listShow = ["Danh sách sách", "Danh sách tài liệu"];
  String? listSelect;
  Widget? selectedWidget;

  @override
  Widget build(BuildContext context) {
    final userInterface = Provider.of<UserInterface>(context);
    return Consumer<RoomManager>(
      builder: (context, roomMangerBook, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Quản lí sách'),
            backgroundColor: userInterface.appBarColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/trangchu');
              },
            ),
          ),
          body: Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                          child: DropdownButton<String>(
                            value: listSelect ?? listShow[0],
                            items: listShow.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                listSelect = newValue;
                                if (newValue == listShow[0]) {
                                  selectedWidget = ShowListBook(
                                      roomMangerBook.listRoomBook,
                                      roomMangerBook._listRoomTypeBook);
                                } else if (newValue == listShow[1]) {
                                  selectedWidget = ShowListTypeBook(
                                      roomMangerBook._listRoomTypeBook);
                                }
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.0, top: 10.0),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: selectedWidget ??
                            ShowListBook(roomMangerBook.listRoomBook,
                                roomMangerBook._listRoomTypeBook),
                      ),
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
