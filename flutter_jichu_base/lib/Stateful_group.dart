import 'package:flutter/material.dart';
import 'package:flutter_jichu_base/Less_group.dart';

import 'PluginUse.dart';

class StatefulGroupUseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '有状态组件的使用',
      color: Colors.orange,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      ),
      home: StatefulPage(title: '有状态组件的使用'),
    );
  }
}

class StatefulPage extends StatefulWidget {
  StatefulPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _StatefulPageState createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('有状态组件的使用'),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          actions: [
            CloseButton(
              color: Colors.red,
              onPressed: (){},
            )
          ],
          flexibleSpace: Icon(Icons.add),
          // bottom: BackButton(color: Colors.blue),
          elevation: 1.0,
          // shape: ShapeBorder(),

        ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页",activeIcon:  Icon(Icons.home),backgroundColor: Colors.grey),
          BottomNavigationBarItem(icon: Icon(Icons.business),label: "上午",activeIcon:  Icon(Icons.business),backgroundColor: Colors.grey),
          BottomNavigationBarItem(icon: Icon(Icons.list),label: "列表",activeIcon:  Icon(Icons.list),backgroundColor: Colors.grey),
        ],
        selectedItemColor: Colors.orange,
        currentIndex: _selectedindex,
        onTap: _selectItem,
      ),
      body: _selecterContainer(_selectedindex),
      // RefreshIndicator(
      //   child: ListView(
      //     children: [
      //       Icon(Icons.add),
      //       Icon(Icons.list),
      //     ],
      //   ),
      //   onRefresh: fuluredelay,
      // ),
    );
  }

  Future<dynamic> fuluredelay() async{
    Future.delayed(Duration(milliseconds: 5000));
    return null;
  }

  void _selectItem(int value) {
       setState(() {
         _selectedindex = value;
       });
  }

  Container  _selecterContainer(int index){
    if(index == 1){
      return Container(
        color: Colors.red,
        child: Image.network("https://flutter.dev/1.jpg"),
      );
    }else if(index == 2){
      return Container(
        color: Colors.orange,
        child: ListView(),
      );
    }else{
        return Container(
          color: Colors.blue,
          child: Text('ddddddddddddd'),
        );
    }
  }
}
