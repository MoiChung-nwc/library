import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:manager_library/models/user_interface.dart';
import 'package:manager_library/widgets/homePage.dart';
import 'package:manager_library/widgets/settings.dart';
import 'package:manager_library/widgets/roomManager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RoomManager()),
        ChangeNotifierProvider(create: (context) => UserInterface()),
      ],
      child: MaterialApp(
        initialRoute: "/caidat",
        routes: {
          "/trangchu": (context) => MyHomePage(),
          "/caidat": (context) => MySetting(),
          "/phong": (context) => MyRoomPage(),
        },
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