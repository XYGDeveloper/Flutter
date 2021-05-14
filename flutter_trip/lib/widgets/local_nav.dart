import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';

class LocalNav extends StatelessWidget{

  final List<CommonModel> localNavlist;

  /**
   * localNavlist,传递过来的球区入口数组
   */
  const LocalNav({Key key,this.localNavlist}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6)),
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
    if(localNavlist == null) return null;
    List<Widget> items = [];
    localNavlist.forEach((commonmodel) { 
      items.add(_item(context,commonmodel));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  /**
   * 里面的每个小widget，由图片和文字构成，形成一个 colomu  widget
   */

  Widget _item(BuildContext context, CommonModel commonmodel) {
    return GestureDetector(
      onTap: (){

      },
      child: Column(
        children: [
           Image.network(commonmodel.icon,width: 32,height: 32,),
           Text(commonmodel.title,style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }

}