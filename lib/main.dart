import 'package:flutter/material.dart';
import 'package:manager_library/widgets/About.dart';
import 'package:provider/provider.dart';
import 'package:manager_library/models/user_interface.dart';
import 'package:manager_library/widgets/homePage.dart';
import 'package:manager_library/widgets/settings.dart';
import 'package:manager_library/widgets/roomManager.dart';
import 'package:manager_library/widgets/About.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RoomManager()),
        ChangeNotifierProvider(create: (context) => UserInterface()),
      ],
      child: MaterialApp(
        initialRoute: "/trangchu",
        routes: {
          "/trangchu": (context) => MyHomePage(),
          "/caidat": (context) => MySetting(),
          "/sach": (context) => MyRoomPage(),
          "/about": (context) => MyAbout(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Provider.of<RoomManager>(context),
      child: RoomManagerWidget(),
    );
  }
}
