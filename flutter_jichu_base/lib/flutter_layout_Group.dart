import 'package:flutter/material.dart';
import 'package:flutter_jichu_base/Less_group.dart';
import 'Pageview.dart';
import 'PluginUse.dart';
import 'Stateful_group.dart';
import 'flutter_layout_Group.dart';

class MylayoutApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MylayoutAppPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MylayoutAppPage extends StatefulWidget {
  MylayoutAppPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MylayoutAppPageState createState() => _MylayoutAppPageState();
}

class _MylayoutAppPageState extends State<MylayoutAppPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
        body:Container(
          width: 300,
          height: 600,
          margin: EdgeInsets.all(20),
          child: Column(
            children: [

              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Text('是否盛满'),
                ),
              ),
              Container(
                child:Container(
                  child: Column(
                    children: [
                      Text('哈哈哈哈哈哈哈哈'),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.amber.shade800),
                          child:Text('盛满Expended') ,
                        ),
                      )
                    ],
                  ),
                )

                /*
                Wrap(
                  spacing: 30,
                  runSpacing: 5,
                  children: [
                    Chip(label: Text('11111111'),avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("1",style: TextStyle(fontSize: 18),),),),
                    Chip(label: Text('11111111'),avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("1",style: TextStyle(fontSize: 18),),),),
                    Chip(label: Text('11111111'),avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("1",style: TextStyle(fontSize: 18),),),),
                    Chip(label: Text('11111111'),avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("1",style: TextStyle(fontSize: 18),),),),
                    Chip(label: Text('11111111'),avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("1",style: TextStyle(fontSize: 18),),),),
                    Chip(label: Text('11111111'),avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("1",style: TextStyle(fontSize: 18),),),),
                    Chip(label: Text('11111111'),avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("1",style: TextStyle(fontSize: 18),),),),
                    Chip(label: Text('11111111'),avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("1",style: TextStyle(fontSize: 18),),),),
                    Chip(label: Text('11111111'),avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("1",style: TextStyle(fontSize: 18),),),),
                    Text('hshshshshshhshs'),

                  ],
                )
                    */
                   /* 
                Stack(
                  children: [
                    Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',width: 100,height: 100,),
                    Positioned(
                      right: 100,
                        bottom: 100,
                        child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',width: 30,height: 30,),
                    )
                  ],
                ),
                */
              )
            ],
          )
            
              /*
          PhysicalModel(color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
            clipBehavior: Clip.antiAlias,
            child: PageView(
              children: [
                Container(width: 200,height: 50,child: Text('11111'),color: Colors.red,),
                Container(width: 200,height: 50,child: Text('22222'),color: Colors.blue,),
                Container(width: 200,height: 50,child: Text('3333'),color: Colors.orange,),
              ],
            ),
          )
*/
        )

           /*
        Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),
                child:ClipRRect(
                  borderRadius:BorderRadius.all(Radius.circular(10)) ,
                    child: Opacity(
                      opacity: 0.8,
                      child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',width: 200,height: 200,),
                    ),
                )
                ),

              ],
            ),
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              width: 200,
              height: 200,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: "请输入用户名",
              ),
              style: TextStyle(fontSize: 20),
            ),
          ],
        )
        */
    );
  }
}

