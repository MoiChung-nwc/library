
import 'package:flutter/material.dart';

class UserInterface with ChangeNotifier {
  static List<String> listColorAppBar = <String>['Grey', 'Purple', 'Red', 'Green', 'Blue'];
  static List<String> listColorBackgroundHomepage = <String>['White', 'Purple', 'Red', 'Green', 'Blue'];

  double _fontSize = 15;
  String _appBarColor = 'Grey';
  String _homePageBackgroundColor = 'White';

  set homePageBackgroundColor(newColor) {
    _homePageBackgroundColor = newColor;
    notifyListeners();
  }

  Color get homePageBackgroundColor {
    switch(_homePageBackgroundColor) {
      case 'White': return Colors.white;
      case 'Purple': return Colors.purple;
      case 'Red': return Colors.red;
      case 'Green': return Colors.green;
      case 'Blue': return Colors.blue;
      default: return Colors.black;
    }
  }

  String get strHomePageBackgroundColor => _homePageBackgroundColor;

  set appBarColor(newColor) {
    _appBarColor = newColor;
    notifyListeners();
  }

  Color get appBarColor {
    switch(_appBarColor) {
      case 'Grey': return Colors.grey;
      case 'Purple': return Colors.purple;
      case 'Red': return Colors.red;
      case 'Green': return Colors.green;
      case 'Blue': return Colors.blue;
      default: return Colors.white;
    }
  }

  String get strAppBarColor => _appBarColor;

  set fontSize(newSize) {
    _fontSize = newSize;
    notifyListeners();
  }

  double get fontSize => _fontSize;
}