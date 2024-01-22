import 'package:flutter/material.dart';
import 'package:manager_library/models/user_interface.dart';
import 'package:provider/provider.dart';
import 'package:manager_library/widgets/components/my_drawer.dart';
import 'package:manager_library/widgets/roomManager.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RoomManager roomMangerBook =
    Provider.of<RoomManager>(context, listen: true);
    return Consumer<UserInterface>(
      builder: (context, ui, child) {
        return Scaffold(
          backgroundColor: ui.homePageBackgroundColor,
          appBar: AppBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Dashboard', style: TextStyle(color: Colors.white)),
                Text('Last update: 21 Jan 2024',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
            backgroundColor: ui.appBarColor,
          ),
          drawer: MyDrawer(),
          body: GridView.count(
            crossAxisCount: 2,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/sach');
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Container(
                      width: ui.fontSize * 10,
                      height: ui.fontSize * 10,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://unicorn-s3.b-cdn.net/Bookshelf-nye5q.jpg',
                            width: ui.fontSize * 7,
                            height: ui.fontSize * 7,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Kho sách',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/');
                  },
                  child: Container(
                      width: ui.fontSize * 10,
                      height: ui.fontSize * 10,

                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://paroda.vn/media/2021/08/customer-service.jpg',
                            width: ui.fontSize * 7,
                            height: ui.fontSize * 7,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Khách hàng',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/trangchu');
                  },
                  child: Container(
                      width: ui.fontSize * 10,
                      height: ui.fontSize * 10,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://cdnphoto.dantri.com.vn/OxivTG4Y9TlTb_IBtgGLvru0DxY=/thumb_w/960/2019/11/23/nang-cao-tu-duy-phan-bien-cho-nhan-vien-1-1574473985934.jpeg',
                            width: ui.fontSize * 7,
                            height: ui.fontSize * 7,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Nhân viên',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/trangchu');
                  },
                  child: Container(
                      width: ui.fontSize * 10,
                      height: ui.fontSize * 10,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://lh7-us.googleusercontent.com/AltEthO7WiA_fB_dsU0ufEZaH4iIzsFkny8mDSAFnH4SZAAjx01paYEmbDe11qSIJiPRr0dG3FTLU3d-gfB_0wjdx-v-v0kjPDk9HLIwkMH1ESKSpz9qTtR8Z38gJ8FM0V36icgb24Qsb8DURIvilec',
                            width: ui.fontSize * 7,
                            height: ui.fontSize * 7,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Mượn trả',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/trangchu');
                  },
                  child: Container(
                      width: ui.fontSize * 10,
                      height: ui.fontSize * 10,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://www.pace.edu.vn/uploads/news/2023/10/tong-quan-ve-doanh-thu.jpg',
                            width: ui.fontSize * 7,
                            height: ui.fontSize * 7,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Doanh thu',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/about');
                  },
                  child: Container(
                      width: ui.fontSize * 10,
                      height: ui.fontSize * 10,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8G0oe-9R-XHGLoIzNMFkVY2W9TuN9T_UnqM_M4yqw5Pe0LFpw1aOXhUi1Onk9MVLs6As&usqp=CAU',
                            width: ui.fontSize * 7,
                            height: ui.fontSize * 7,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Thông tin',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
