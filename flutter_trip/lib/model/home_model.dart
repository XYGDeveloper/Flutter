
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/config_model.dart';
import 'package:flutter_trip/model/gridnav_Model.dart';
import 'package:flutter_trip/model/scales_model.dart';

class HomeModel {

  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final GirdNavModel gridNav;
  final List<CommonModel> subNavList;
  final ScalesModel salesBox;

  HomeModel({this.config, this.bannerList, this.localNavList, this.gridNav,
    this.subNavList, this.salesBox});

  factory HomeModel.fromJson(Map<String,dynamic> json) {
    
    var bannerListJson = json['bannerList'] as List;
    List<CommonModel> bannerList = bannerListJson.map((i) =>CommonModel.fromJson(i)).toList();

    var localNavListJson = json['localNavList'] as List;
    List<CommonModel> localNavList = localNavListJson.map((i) =>CommonModel.fromJson(i)).toList();

    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> subNavList = subNavListJson.map((i) =>CommonModel.fromJson(i)).toList();
    return HomeModel(
      config: ConfigModel.fromJson(json['config']),
      gridNav: GirdNavModel.fromJson(json['gridNav']),
      salesBox: ScalesModel.fromJson(json['salesBox']),
      bannerList: bannerList,
      localNavList: localNavList,
      subNavList: subNavList,
    );
  }

  Map<String,dynamic> tojson(){
    Map<String,dynamic> map = Map();
    map['config'] = this.config.toJson();
    map['gridNav'] = this.gridNav.toJson();
    map['salesBox'] = this.salesBox.toJson();
    map['bannerList'] = this.bannerList.map((i) => i.toJson()).toList();
    map['localNavList'] = this.localNavList.map((i) => i.toJson()).toList();
    map['subNavList'] = this.subNavList.map((i) => i.toJson()).toList();
    return map;
  }

}