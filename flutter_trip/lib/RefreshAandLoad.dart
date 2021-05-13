import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ListViewPage extends StatefulWidget{
  @override
  _ListViewPageState createState() =>_ListViewPageState();

}

class _ListViewPageState extends State<ListViewPage>{

  List<String> _dataArray =  [ '北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '武汉', '郑州', '洛阳', '厦门', '青岛', '拉萨' ];

  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        setState(() {
          _loadData();
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: ListView(
          controller: _scrollController,
          children: _buildList(),
        ),
        onRefresh: _handleUprefresh,
      )
    );
  }

  List<Widget> _buildList() {
    return _dataArray.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.black12),
      child: Text(city,style: TextStyle(fontSize: 25),),
    );
  }

   //上拉刷新，用RefreshIndicator包裹列表
  Future<void> _handleUprefresh() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _dataArray = _dataArray.reversed.toList();
    });
  }

  void _loadData() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      List<String> list = List<String>.from(_dataArray);
      list.addAll(_dataArray);
      _dataArray = list;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

}