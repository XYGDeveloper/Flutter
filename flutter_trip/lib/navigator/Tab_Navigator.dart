import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/me_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';

class TabbarNavigator extends StatefulWidget{
  @override
  _TabbarNavigatorState createState() =>_TabbarNavigatorState();

}

class _TabbarNavigatorState extends State<TabbarNavigator>{

  final _normalColor = Colors.grey;
  final _selectedColor = Colors.blue;
   int _currentIndex = 0;

  final PageController _controller = PageController(
    initialPage:0
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed ,
        currentIndex: _currentIndex,
        onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home ,color: _normalColor,),
              activeIcon: Icon(Icons.home,color: _selectedColor,),
              title: Text('首页',style: TextStyle(color: _currentIndex != 0?_normalColor:_selectedColor),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search ,color: _normalColor,),
              activeIcon: Icon(Icons.search,color: _selectedColor,),
              title: Text('搜索',style: TextStyle(color: _currentIndex != 1?_normalColor:_selectedColor),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt ,color: _normalColor,),
              activeIcon: Icon(Icons.camera_alt,color: _selectedColor,),
              title: Text('旅拍',style: TextStyle(color: _currentIndex != 2?_normalColor:_selectedColor),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle ,color: _normalColor,),
              activeIcon: Icon(Icons.account_circle,color: _selectedColor,),
              title: Text('我的',style: TextStyle(color: _currentIndex != 3?_normalColor:_selectedColor),)
          ),
        ],
      ),
    );
  }

}