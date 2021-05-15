import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/gridnav_Model.dart';
import 'package:flutter_trip/widgets/web_view.dart';

class GirdNav extends StatelessWidget{
  final GirdNavModel girdNavModel;

  /**
   * 网格布局
   */
  const GirdNav({Key key,this.girdNavModel}):super(key: key);

  @override
  Widget build(BuildContext context) {
    //用PhysicalModel设置圆角
    return PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        clipBehavior:Clip.antiAlias,
        child: Column(
          children: _gridNavItems(context),
        ),
    );
  }

  /**
  * ${enclosing_method}(用来将布局分为上中下三部分)
  * @param context
  * @return widget数组
  */

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if(girdNavModel == null) return items;
    //接下来将卡片分为上中下三部分
    if(girdNavModel.hotel != null){
        items.add(_girdNavItem(context, girdNavModel.hotel, true));
    }
    if(girdNavModel.flight != null){
      items.add(_girdNavItem(context, girdNavModel.flight, false));
    }
    if(girdNavModel.travel != null){
      items.add(_girdNavItem(context, girdNavModel.travel, false));
    }
    return items;
  }

  /**
  * ${enclosing_method}(返回每个item，进行左，中，右布局)
  * @param context  上下文
  * @param girdNavItem  model
  * @param  first  是否是第一个main item
  */

  _girdNavItem(BuildContext context,GirdNavItem girdNavItem, bool first){
      List<Widget> items = [];
      items.add(_mainItem(context, girdNavItem.mainItem));
      items.add(_doubleItem(context,girdNavItem.item1, girdNavItem.item2));
      items.add(_doubleItem(context,girdNavItem.item3, girdNavItem.item4));
      List<Widget> exandItems = [];
      items.forEach((item) {
        exandItems.add(Expanded(child: item,flex: 1,));
      });
      Color startColor = Color(int.parse('0xff'+girdNavItem.startColor));
      Color endColor = Color(int.parse('0xff'+girdNavItem.endColor));
      return Container(
        height: 88,
        margin: first?null:EdgeInsets.only(top: 3),
        //设置线性渐变
        decoration: BoxDecoration(gradient: LinearGradient(colors: [startColor,endColor])),
        child: Row(children:exandItems),
      );
  }

   /**
   * ${enclosing_method}(左边的大网格 mainitem)
   * @param model  item model
   * @param model  context
   * @return widget
   */

  _mainItem(BuildContext context,CommonModel model){
     return _warpGesture(context, model, GestureDetector(
       child: Stack(
         alignment: Alignment.topCenter,
         children: [
           Image.network(model.icon, width: 80,height: 120,fit: BoxFit.contain,alignment: AlignmentDirectional.bottomEnd,),
           Container(
               margin: EdgeInsets.only(top: 18),
               child: Text(model.title,style: TextStyle(fontSize: 12,color: Colors.white),),)
         ],
       ),
     ));
  }

  /**
  * ${enclosing_method}(生成小的item，将两个item作为一个组件)
  * @param name
  * @param @return 设定文件
  * @return String DOM对象
  * @Exception 异常对象
  * @since  CodingExample　Ver(编码范例查看) 1.1
  */

   _doubleItem(BuildContext context,CommonModel topItem, CommonModel bottomitem,){
       return Column(
         children: [
           //高度撑满布局
           Expanded(child: _item(context, topItem, true)),
           Expanded(child: _item(context, bottomitem, false)),
         ],
       );
   }

   /**
   * ${enclosing_method}(每一个小的左右小item)
   * @param iscenterItem 是不是中间的item
   * @param isfirst 是不是第一个item
   */

  _item(BuildContext context,CommonModel model, bool isfirst) {
    BorderSide _boederside = BorderSide(width: 0.8,color: Colors.white);
    //宽度撑满布局
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          border:Border(left: _boederside,bottom:isfirst?_boederside:BorderSide.none,
          )
        ),
        child:_warpGesture(context, model, Center(
          child: Text(model.title,style: TextStyle(fontSize: 12,color: Colors.white,),textAlign: TextAlign.center,
          ),
        ) ,)
      ),
    );
  }

  _warpGesture(BuildContext context,CommonModel model,Widget widget){
    return GestureDetector(
      child: widget,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WebView(
          url: model.url,
          statusBarColor: model.statusBarColor,
          title: model.title,
          hideAppBar: false,
          backForbid: true,
        )));
      },
    );
  }

}