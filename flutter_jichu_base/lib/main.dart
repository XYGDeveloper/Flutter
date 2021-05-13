import 'package:flutter/material.dart';
import 'package:flutter_jichu_base/Less_group.dart';

import 'Image_pickerDemo.dart';
import 'Pageview.dart';
import 'Photo_app_demo.dart';
import 'PluginUse.dart';
import 'Stateful_group.dart';
import 'flutter_layout_Group.dart';

void main() {
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由跳转',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '路由跳转'),
      routes:<String,WidgetBuilder>{
        'layout':(BuildContext context)=>MylayoutApp(),
        'less':(BuildContext context)=>LessGroupState(),
        'pageview':(BuildContext context)=>Pageviewapp(),
        'plugin':(BuildContext context)=>PluginUse(),
        'staful':(BuildContext context)=>StatefulPage(),
        'imager_picker_demo':(BuildContext context)=>Image_pickerdemoApp(),
        'photo':(BuildContext context)=>photo_pickerdemoApp(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _name = false;

  _item(String title,page,String name) {
    return ElevatedButton(onPressed: (){
      if(_name){
        Navigator.pushNamed(context, name);
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
      }
    }, child: Text(title));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            SwitchListTile(
                title: Text('${_name?' ':'不'}通过路由名跳转'),
                value: _name,
                onChanged: (value){
                  _name = value;
            }),
            _item("布局", MylayoutApp(), 'layout'),
            _item("无状态", LessGroupState(), 'less'),
            _item("pageview", Pageviewapp(), 'pageview'),
            _item("插件使用", PluginUse(), 'plugin'),
            _item("有状态", StatefulPage(), 'staful'),
            _item("imager_picker_demo", Image_pickerdemoApp(), 'imager_picker_demo'),
            _item("拍照app", photo_pickerdemoApp(), 'photo'),
          ],
        ),
      )

    );
  }


}
