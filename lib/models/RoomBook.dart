import 'RoomTypeBook.dart';

class RoomBook {
  final String nameBook;
  final int idBook;
  final bool status;
  final RoomTypeBook type;

  RoomBook({
    required this.nameBook,
    required this.idBook,
    required this.status,
    required this.type,
});
}