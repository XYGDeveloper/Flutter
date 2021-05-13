import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'package:flutter_trip/model/home_model.dart';
const APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() =>_HomePageState();

}

class _HomePageState extends State<HomePage>{



  List<String> _imageurl = [
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1832803776,3613997408&fm=26&gp=0.jpg',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01c2dc5aa0ef6ea801206d965bf215.jpg%401280w_1l_2o_100sh.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1623332870&t=69f1d42afc447c1ef2ea86679805837d',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F019f8358c1010ea801219c772d587a.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1623332870&t=a1c94cc8515fb4aed687c17a3a19be82'
  ];
  double appBarAlpha = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (scrollviewNotifcation){
                  if(scrollviewNotifcation is ScrollUpdateNotification && scrollviewNotifcation.depth == 0){
                    _onscroll(scrollviewNotifcation.metrics.pixels);
                  }
                },
                child: ListView(
                  children: [
                    Container(
                      height: 160,
                      child: Swiper(
                        itemCount: _imageurl.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context,int index){
                          return Image.network(_imageurl[index],fit: BoxFit.fill,);
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 800,
                      child: ListTile(title: Text('哈哈'),),
                    )
                  ],
                ),
              )),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 80,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
              ),
        ],
      )
    );
  }

  void _onscroll(double offset) {
    double alpha = offset/APPBAR_SCROLL_OFFSET;
    if(alpha < 0){
      alpha = 0;
    }else if(alpha > 1){
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }



  //测试dao层和model层
  @override
  void initState() {
    super.initState();
    _loaddata();
  }

  Future<Null> _loaddata() async{
    HomeModel model = await HomeDao.fetch();
    print(model.tojson());
    return null;
  }

}