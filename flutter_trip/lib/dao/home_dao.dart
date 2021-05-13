
import 'dart:convert';
import 'dart:async';
import 'package:flutter_trip/model/home_model.dart';
import 'package:http/http.dart' as http;

const String  Domin = 'www.devio.org';
/**
 * 首页接口
 */

class HomeDao {
  static Future<HomeModel> fetch() async {

     final response =  await http.get(Uri.http(Domin, 'io/flutter_app/json/home_page.json'));
     if(response.statusCode == 200){
        //解决中文乱码
       Utf8Decoder utf8decoder = Utf8Decoder();
       var result = json.decode(utf8decoder.convert(response.bodyBytes));
       return HomeModel.fromJson(result);
     }else{
       Exception('fail to load home_page.json');
     }
  }

}