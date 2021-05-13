import 'package:flutter/material.dart';
import 'package:flutter_jichu_base/Less_group.dart';

import 'PluginUse.dart';
import 'Stateful_group.dart';

class Pageviewapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Pagevieww(title: 'Flutter Demo Home Page'),
    );
  }
}

class Pagevieww extends StatefulWidget {
  Pagevieww({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PageviewState createState() => _PageviewState();
}

class _PageviewState extends State<Pagevieww> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          width: 400,
          height: 400,
          padding: EdgeInsets.only(left: 10),
          child: PageView(
            children: [
             Container(color: Colors.blue,
               child: TextField(
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                   hintText: '请输入姓名',
                     hintStyle: TextStyle(fontSize: 20),
                 ),
                 style: TextStyle(fontSize: 20),
               ),
               width: 200,
               height: 100,),
              Container(color: Colors.orange,
                child: Image.network("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"),
                width: 200,
                height: 100,),
              Container(color: Colors.blue,
                child: Text('333333'),
                width: 200,
                height: 100,),
      ],

          ),
        )
    );
  }


}
