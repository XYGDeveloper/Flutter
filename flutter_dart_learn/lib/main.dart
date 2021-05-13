import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/OOP_learn.dart';
import 'package:flutter_dart_learn/function_learn.dart';
import 'DataType.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dart基础必备',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'dart基础必备'),
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

  @override
  Widget build(BuildContext context) {
     _oopLearn();
     _Test();
    return Scaffold(
      appBar: AppBar(

        title: Text('数据类型'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            DataTYpe()
          ],
        )
      ),

    );

  }
  void _oopLearn(){
    print("-----------------工厂构造方法创建唯一一个实力----------------------");
      Logger log1 = Logger();
      Logger log2 = Logger();
      print(log1 == log2);

      Student student = Student("beida", "jsck", 23);
      student.school = "wwww";
      print(student.school);
      print(student.toString());
      Student.printls("hhh");
      Student stu1 = Student("qinghua", "haha", 30,city: "beijing",country: "china");
      print(stu1.toString());

      //
    FlutterStudy study = FlutterStudy();
    study.study();

    //测试方法


  }


  void _Test() {
    //方法的学修
    TestFunction func = TestFunction();
    func.test();

  }
}
