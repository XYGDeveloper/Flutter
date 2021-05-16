import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/scales_model.dart';
import 'package:flutter_trip/widgets/web_view.dart';

class SacleNav extends StatelessWidget{

  final ScalesModel scalebox;

  const SacleNav({Key key,this.scalebox}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child:_items(context)
    );
  }

  _doubleItem(BuildContext context,CommonModel leftCard,CommonModel rightCard,bool big,bool last){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        _item(context, leftCard,big,true,last),
        _item(context, rightCard,big,false,last)
    ]
    );
  }

  /**
   * 将里面的四个widget添加到row里面形成1个大的row widget
   */
  Widget _items(BuildContext context) {
    if(scalebox == null) return null;
    List<Widget> items = [];
    items.add(_doubleItem(context, scalebox.bigCard1, scalebox.bigCard2, true, false));
    items.add(_doubleItem(context, scalebox.smallCard1, scalebox.smallCard2, false, false));
    items.add(_doubleItem(context, scalebox.smallCard3, scalebox.smallCard4, false, true));
    return Column(
      children: [
          Container(
            height: 44,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xfff2f2f2)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(scalebox.icon,height: 15,fit: BoxFit.fill),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 1, 8, 1),
                  margin: EdgeInsets.only(right: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        colors: [Color(0xfffff4e63),Color(0xffff6cc9)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebView(
                        url: scalebox.moreUrl,
                        title: '查看更多'
                      )));
                      },
                    child: Text('获取更多福利 >',style: TextStyle(fontSize: 12,color: Colors.white))
                  ),
                )
              ],
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(0,1)
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.sublist(1,2)
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.sublist(2,3)
        ),
      ],
    );
  }

  /**
   * 里面的每个小widget，由图片和文字构成，形成一个 colomu  widget
   */

  Widget _item(BuildContext context, CommonModel model,bool big,bool left,bool last ) {
    BorderSide borderSize = BorderSide(width: 0.8,color: Color(0xffff2f2));
    return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WebView(
              url: model.url,
              statusBarColor: model.statusBarColor,
              title: model.title,
              hideAppBar: false,
              backForbid: true,
            )));
          },
          child: Container(
            decoration: BoxDecoration(border:Border(right: left? borderSize:BorderSide.none,bottom: last?BorderSide.none:borderSize)),
            child:Image.network(model.icon,width:MediaQuery.of(context).size.width/2-10,height: big?129:80,fit: BoxFit.fill),

          )
        );
  }

}