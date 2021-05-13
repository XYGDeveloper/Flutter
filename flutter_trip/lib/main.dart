import 'package:flutter/material.dart';
import 'package:flutter_trip/RefreshAandLoad.dart';
import 'package:http/http.dart' as http;
import 'navigator/Tab_Navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabbarNavigator()
    );
  }
}


