import 'package:flutter_trip/model/common_model.dart';

class GirdNavModel{
  final GirdNavItem hotel;
  final GirdNavItem flight;
  final GirdNavItem travel;

  GirdNavModel({this.hotel, this.flight, this.travel});

  factory GirdNavModel.fromJson(Map<String,dynamic> json){
    return GirdNavModel(
      hotel: GirdNavItem.fromJson(json['hotel']),
      flight: GirdNavItem.fromJson(json['flight']),
      travel: GirdNavItem.fromJson(json['travel']),
    );
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> map = Map();
    map['hotel'] = this.hotel.tojson();
    map['flight'] = this.flight.tojson();
    map['travel'] = this.travel.tojson();
    return map;
  }

}

class GirdNavItem{

  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GirdNavItem({this.startColor, this.endColor, this.mainItem, this.item1,
    this.item2, this.item3, this.item4});

  factory GirdNavItem.fromJson(Map<String,dynamic> json){
    return GirdNavItem(
      startColor: json['startColor'],
      endColor: json['endColor'],
      mainItem:CommonModel.fromJson(json['mainItem']),
      item1:CommonModel.fromJson(json['item1']),
      item2:CommonModel.fromJson(json['item2']),
      item3:CommonModel.fromJson(json['item3']),
      item4:CommonModel.fromJson(json['item4']),
    );
  }

  Map<String,dynamic> tojson(){
    Map<String,dynamic> map = Map();
    map['startColor'] = this.startColor;
    map['endColor'] = this.endColor;
    if(this.mainItem != null){
      map['mainItem'] = this.mainItem.toJson();
    }
    if(this.item1 != null){
      map['item1'] = this.item1.toJson();
    }
    if(this.item2 != null){
      map['item2'] = this.item2.toJson();
    }
    if(this.item3 != null){
      map['item3'] = this.item3.toJson();
    }
    if(this.item4 != null){
      map['item4'] = this.item4.toJson();
    }
    return map;
  }

}