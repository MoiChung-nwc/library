import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_library/models/user_interface.dart';
import 'package:manager_library/widgets/components/my_drawer.dart';
import 'package:provider/provider.dart';

class MyAbout extends StatelessWidget {
  const MyAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        actions: [
          IconButton(
            icon: Icon(Icons.home), // Use your desired home icon here
            onPressed: () {
              Navigator.of(context).pushNamed('/trangchu'); // Navigate to home page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('images/me.jpg'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'Mới Chung', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '03107085816', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'abc address, xyz city', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile('Email', 'ahadhashmideveloper@gmail.com', CupertinoIcons.mail),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text('Edit Profile'),
              ),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.deepOrange.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
