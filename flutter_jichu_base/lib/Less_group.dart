import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class LessGroupState extends StatelessWidget {
  TextStyle _textstyle = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter常见的无状态组件',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        appBar: AppBar(title: Text('flutter常见的无状态组件'),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.orange),
          // color: Colors.red,
          width: 400,
          height: 300,
          child: Column(
            children: [
              Text('flutter常见的无状态组件',
                style: _textstyle,
              strutStyle: StrutStyle(fontSize: 25),
                textAlign:TextAlign.left ,
                textDirection: TextDirection.rtl,
                softWrap:false ,
                // overflow: TextOverflow.clip,
                // textScaleFactor: 25.0,
                // maxLines: 20,
                // semanticsLabel: 'hello',
                // textWidthBasis: TextWidthBasis.parent,
              ),
              Icon(Icons.add_a_photo,color: Colors.blue,size: 100,semanticLabel: 'ddddd',),
              CloseButton(color: Colors.black,onPressed: (){},),
              BackButton(color: Colors.blue,onPressed: ()=>{},),
              Chip(label: Text('昵称'),
              avatar: Icon(Icons.list),
                deleteIcon: Icon(Icons.delete),
                onDeleted: (){},
                // visualDensity: VisualDensity(0,0),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                elevation: 10,
                shadowColor: Colors.green,
              ),
              Divider(
                height: 10,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Colors.red,
              ),
                Card(
                  color: Colors.blue,
                  shadowColor: Colors.grey,
                  elevation: 2,
                  borderOnForeground: true,

                ),
            ],
          ),
        ),
        floatingActionButton: CloseButton(color: Colors.blue),

      )
    );
  }
}

