import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/trangchu'),
            child: ListTile(
              title: Text('Trang chủ'),
              leading: Icon(Icons.home, color: Colors.indigo),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/'),
            child: ListTile(
              title: Text('Kho sách'),
              leading: Icon(Icons.menu_book, color: Colors.blue),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/'),
            child: ListTile(
              title: Text('Khách hàng'),
              leading: Icon(Icons.co_present, color: Colors.blue),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/'),
            child: ListTile(
              title: Text('Nhân viên'),
              leading: Icon(Icons.person, color: Colors.blue),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/'),
            child: ListTile(
              title: Text('Mượn trả'),
              leading: Icon(Icons.calendar_month_outlined, color: Colors.blue),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/'),
            child: ListTile(
              title: Text('Doanh thu'),
              leading: Icon(Icons.price_check_outlined, color: Colors.blue),
            ),
          ),

          Divider(),

          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/caidat'),
            child: ListTile(
              title: Text('Cài đặt'),
              leading: Icon(Icons.settings, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
