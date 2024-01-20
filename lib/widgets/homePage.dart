import 'package:flutter/material.dart';
import 'package:manager_library/models/user_interface.dart';
import 'package:provider/provider.dart';
import 'package:manager_library/widgets/components/my_drawer.dart';
import 'package:manager_library/widgets/roomManager.dart';



class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    RoomManager roomMangerBook = Provider.of<RoomManager>(context, listen: true);
    return Consumer<UserInterface>(
      builder: (context, ui, child) {
        return Scaffold(

          appBar: AppBar(
            title: Text("Thông tin hệ thống"),
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
                    Navigator.of(context).popAndPushNamed('/phong');
                  },
                  style: ButtonStyle(
                    //backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Container(
                      width: ui.fontSize * 7.3,
                      height: ui.fontSize * 7.3 ,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://img.lovepik.com/original_origin_pic/18/03/18/d3d28686a9db59af940cd2cc7d5b0c92.png_wh860.png',
                            width: ui.fontSize * 4,
                            height: ui.fontSize * 4,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Phòng',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/caidat');
                  },
                  child: Container(
                      width: ui.fontSize * 7.3,
                      height: ui.fontSize * 7.3 ,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://tusachtiasang.org/wp-content/uploads/2021/07/Lang-nghe-trong-giao-tep.jpg',
                            width: ui.fontSize * 4,
                            height: ui.fontSize * 4,
                          ),
                          SizedBox(height: 8.0,),
                          Text(
                            'Khách hàng',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/caidat');
                  },
                  child: Container(
                      width: ui.fontSize * 7.3,
                      height: ui.fontSize * 7.3 ,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://img.lovepik.com/free-png/20211229/lovepik-customer-service-personnel-icon-png-image_400960955_wh860.png',
                            width: ui.fontSize * 4,
                            height: ui.fontSize * 4,
                          ),
                          SizedBox(height: 8.0,),
                          Text(
                            'Dịch vụ',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/caidat');
                  },
                  child: Container(
                      width: ui.fontSize * 7.3,
                      height: ui.fontSize * 7.3,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://img.lovepik.com/free-png/20211211/lovepik-data-statistics-analysis-icon-free-vector-png-image_401493443_wh1200.png',
                            width: ui.fontSize * 4,
                            height: ui.fontSize * 4,
                          ),
                          SizedBox(height: 8.0,),
                          Text(
                            'Thống kê',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/caidat');
                  },
                  child: Container(
                      width: ui.fontSize * 7.3,
                      height: ui.fontSize * 7.3 ,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://media.istockphoto.com/id/1372148093/vi/vec-to/c%E1%BA%A7m-tay-%C4%91i%E1%BB%87n-tho%E1%BA%A1i-v%E1%BB%9Bi-s%E1%BB%95-tr%E1%BB%B1c-tuy%E1%BA%BFn-c%E1%BB%A7a-kh%C3%A1ch-s%E1%BA%A1n-%C4%91%E1%BA%B7t-ph%C3%B2ng-kh%C3%A1ch-s%E1%BA%A1n-v%C3%A9-v%C3%A0-chuy%E1%BA%BFn-bay-%C4%91i%E1%BB%87n.jpg?s=612x612&w=is&k=20&c=1WD04F5RNbPq47pG1p0or4NizdJQeRf1LohVvHeoctA=',
                            width: ui.fontSize * 4,
                            height: ui.fontSize * 4,
                          ),
                          SizedBox(height: 8.0,),
                          Text(
                            'Đặt trả',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/caidat');
                  },
                  child: Container(
                      width: ui.fontSize * 7.3,
                      height: ui.fontSize * 7.3,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8G0oe-9R-XHGLoIzNMFkVY2W9TuN9T_UnqM_M4yqw5Pe0LFpw1aOXhUi1Onk9MVLs6As&usqp=CAU',
                            width: ui.fontSize * 4,
                            height: ui.fontSize * 4,
                          ),
                          SizedBox(height: 8.0,),
                          Text(
                            'Thông tin',
                            style: TextStyle(fontSize: ui.fontSize),
                          )
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}