import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/widgets/web_view.dart';

class SubNav extends StatelessWidget{

  final List<CommonModel> subNavList;

  /**
   * localNavlist,传递过来的球区入口数组
   */
  const SubNav({Key key,this.subNavList}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.all(7),
        child:_items(context),
      ),
    );
  }

  /**
   * 将里面的四个widget添加到row里面形成1个大的row widget
   */
  Widget _items(BuildContext context) {
    if(subNavList == null) return null;
    List<Widget> items = [];
    subNavList.forEach((model) {
      items.add(_item(context,model));
    });

    //计算第一行显示的数量
    int sep = (subNavList.length/2 +0.5).toInt();
    return Column(
      children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0,sep),
        ),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.sublist(sep,subNavList.length),
            ),
        )
      ],
    );
  }

  /**
   * 里面的每个小widget，由图片和文字构成，形成一个 colomu  widget
   */

  Widget _item(BuildContext context, CommonModel model) {
    return Expanded(
      flex: 1,
        child: GestureDetector(
        onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WebView(
          url: model.url,
          statusBarColor: model.statusBarColor,
          title: model.title,
          hideAppBar: false,
          backForbid: true,
        )));
      },
      child: Column(
        children: [
          Image.network(model.icon,width: 18,height: 18,),
          Padding(padding: EdgeInsets.only(top: 3),child: Text(model.title,style: TextStyle(fontSize: 12),),)
        ],
      ),
    ));
  }

}