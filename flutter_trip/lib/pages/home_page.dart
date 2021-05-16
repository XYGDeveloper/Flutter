import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/gridnav_Model.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/model/scales_model.dart';
import 'package:flutter_trip/widgets/gird_nav.dart';
import 'package:flutter_trip/widgets/loading_container.dart';
import 'package:flutter_trip/widgets/local_nav.dart';
import 'package:flutter_trip/widgets/scale_box.dart';
import 'package:flutter_trip/widgets/search_bar.dart';
import 'package:flutter_trip/widgets/sub_nav.dart';
import 'package:flutter_trip/widgets/web_view.dart';
const APPBAR_SCROLL_OFFSET = 100;

const SEARCH_BAR_DEFAULT_TEXT='网红打卡地 酒店 美食 旅游';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() =>_HomePageState();

}

class _HomePageState extends State<HomePage>{

  //定义球区入口接收数组
  List<CommonModel> localNavlist = [];
  GirdNavModel girdNavModel;
  List<CommonModel> subNavlist = [];
  ScalesModel scaleModel;
  bool _loading = true;  //设置默认加载
  List<CommonModel> bannerlist = [];

  double appBarAlpha = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(child: Stack(
        children: [
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: RefreshIndicator(
                  onRefresh: _handleRefresh,
                  child: NotificationListener(
                onNotification: (scrollviewNotifcation){
                  if(scrollviewNotifcation is ScrollUpdateNotification && scrollviewNotifcation.depth == 0){
                    _onscroll(scrollviewNotifcation.metrics.pixels);
                  }
                },
                child: _listview,
              ))),
          _appbar
        ],
      ) ,isLoading: _loading)
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
    _handleRefresh();
  }


  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavlist = model.localNavList;
        girdNavModel = model.gridNav;
        subNavlist = model.subNavList;
        scaleModel = model.salesBox;
        bannerlist = model.bannerList;
        _loading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _loading = false;
      });
    }
    return null;
  }

  Widget get _listview{
    return ListView(
      children: [
        _banner,
        Padding(padding:EdgeInsets.fromLTRB(7, 4, 7, 4),
            child: LocalNav(localNavlist:localNavlist)),
        Padding(padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
            child: GirdNav(girdNavModel: girdNavModel)),
        Padding(padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
            child: SubNav(subNavList: subNavlist)),
        Padding(padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
            child: SacleNav(scalebox: scaleModel))
      ],
    );
  }

  Widget get _appbar{
    // return Opacity(
    //   opacity: appBarAlpha,
    //   child: Container(
    //     decoration: BoxDecoration(color: Colors.white),
    //     height: 80,
    //     child: Center(
    //       child: Padding(
    //         padding: EdgeInsets.only(top: 20),
    //         child: Text('首页'),
    //       ),
    //     ),
    //   ),
    // );
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x66000000),Colors.transparent],begin: Alignment.topCenter,end: Alignment.bottomCenter),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80,
            decoration:BoxDecoration(
              color: Color.fromARGB((appBarAlpha *255).toInt(), 255, 255, 255)
            ),
            child: SearchBar(
              searchBarType: appBarAlpha>0.2?SearchBarType.homeLight:SearchBarType.home,
              inputBoxClick: _jumptoSearch,
              speakClick: _jumptoYuyin,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: (){},
            ),
          ),
        ),
        Container(
          height: appBarAlpha >0.2?0.5:0,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 0.5)]
          ),
        ),
      ],
    );



  }

  Widget get _banner{
   return Container(
      height: 160,
      child: Swiper(
        itemCount: bannerlist.length,
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WebView(
              url: bannerlist[index].url,
              statusBarColor: bannerlist[index].statusBarColor,
              title: bannerlist[index].title,
              hideAppBar: bannerlist[index].hideAppBar,
            )));
          },child: Image.network(bannerlist[index].icon,fit: BoxFit.fill,));
        },
        pagination: SwiperPagination(),
      ),
    );
  }



  void _jumptoSearch() {
  }

  void _jumptoYuyin(){

  }


}