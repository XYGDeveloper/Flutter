import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/search_dao.dart';
import 'package:flutter_trip/model/search_model.dart';
import 'package:flutter_trip/widgets/search_bar.dart';

class SearchPage extends StatefulWidget{
  @override
  _SearchPageState createState() =>_SearchPageState();

}

class _SearchPageState extends State<SearchPage>{
  final PageController _controller = PageController(
      initialPage: 0,
  );
  String _result= '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('搜索'),
        ),
        body: Column(
          children: [
            SearchBar(
              hideLeft: true,
              hint: '哈哈',
              defaultText: '123',
              onChanged: _onTextChange(),
            ),
            InkWell(
              onTap: (){
                  getdata();
              },
              child: Text('search'),
            )
          ],
        )
    );
  }

  _onTextChange() {


  }


  Future<Null> getdata() async{
    SearchModel model  =  await SearchDao.fetch('https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=长城');
    setState(() {
      _result = model.data.toString();
    });
    return null;
  }

}