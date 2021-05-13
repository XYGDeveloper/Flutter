// "icon": "http://www.devio.org/io/flutter_app/img/sales_box_huodong.png",
// "moreUrl": "https://contents.ctrip.com/activitysetupapp/mkt/index/moreact",
// "bigCard1": {
// "icon": "https://dimg04.c-ctrip.com/images/700t0y000000m71h523FE_375_260_342.png",
// "url": "https://contents.ctrip.com/buildingblocksweb/special/membershipcard/index.html?sceneid=1&productid=14912&ishidenavbar=yes&pushcode=act_svip_hm31",
// "title": "娲诲姩"
// },
// "bigCard2": {
// "icon": "https://dimg04.c-ctrip.com/images/700a10000000portu2BAD_375_260_342.jpg",
// "url": "https://m.ctrip.com/webapp/you/livestream/plan/crhHotelList.html?liveAwaken=true&isHideHeader=true&isHideNavBar=YES&mktcrhcode=hotevent",
// "title": "娲诲姩"
// },
// "smallCard1": {
// "icon": "https://dimg04.c-ctrip.com/images/700b0z000000neoth8688_375_160_345.jpg",
// "url": "https://contents.ctrip.com/activitysetupapp/mkt/index/nbaafs?pushcode=IP_nbaafs004",
// "title": "娲诲姩"
// },
// "smallCard2": {
// "icon": "https://dimg04.c-ctrip.com/images/700w0z000000mogkyEF78_375_160_345.jpg",
// "url": "https://smarket.ctrip.com/webapp/promocode/add?source=5",
// "title": "娲诲姩"
// },
// "smallCard3": {
// "icon": "https://dimg04.c-ctrip.com/images/700a0t000000im512AB2C_375_160_345.jpg",
// "url": "https://smarket.ctrip.com/webapp/promocode/add?source=5",
// "title": "娲诲姩"
// },
// "smallCard4": {
// "icon": "https://dimg04.c-ctrip.com/images/700d0s000000htvwo16C4_375_160_345.jpg",
// "url": "https://smarket.ctrip.com/webapp/promocode/add?source=5",
// "title": "娲诲姩"
// }

import 'package:flutter_trip/model/common_model.dart';

class ScalesModel{

  final String icon;
  final String moreUrl;
  final CommonModel bigCard1;
  final CommonModel bigCard2;
  final CommonModel smallCard1;
  final CommonModel smallCard2;
  final CommonModel smallCard3;
  final CommonModel smallCard4;

  ScalesModel({this.icon, this.moreUrl, this.bigCard1, this.bigCard2,
    this.smallCard1, this.smallCard2, this.smallCard3, this.smallCard4});
  factory ScalesModel.fromJson(Map<String,dynamic> json){
    return ScalesModel(
      icon: json['icon'],
      moreUrl: json['moreUrl'],
      bigCard1: CommonModel.fromJson(json['bigCard1']),
      bigCard2: CommonModel.fromJson(json['bigCard2']),
      smallCard1: CommonModel.fromJson(json['smallCard1']),
      smallCard2: CommonModel.fromJson(json['smallCard2']),
      smallCard3: CommonModel.fromJson(json['smallCard3']),
      smallCard4: CommonModel.fromJson(json['smallCard4']),
    );
  }


  Map<String,dynamic> toJson(){
    Map<String,dynamic> map = Map();
    map['icon'] = this.icon;
    map['moreUrl'] = this.moreUrl;
    if(bigCard1!= null){
      map['bigCard1'] = this.bigCard1.toJson();
    }
    if(bigCard2!= null){
      map['bigCard2'] = this.bigCard2.toJson();
    }
    if(smallCard1!= null){
      map['smallCard1'] = this.smallCard1.toJson();
    }
    if(smallCard2!= null){
      map['smallCard2'] = this.smallCard2.toJson();
    }if(smallCard3!= null){
      map['smallCard3'] = this.smallCard3.toJson();
    }if(bigCard2!= null){
      map['smallCard4'] = this.smallCard4.toJson();
    }
    return map;
  }

}