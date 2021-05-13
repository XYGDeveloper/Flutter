import 'package:flutter/material.dart';

class MePage extends StatefulWidget{
  @override
  _MePageState createState() =>_MePageState();

}

class _MePageState extends State<MePage>{
  final PageController _controller = PageController(
      initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的'),
        ),
        body: Center(
          child: Text('我的'),
        )
    );
  }

}