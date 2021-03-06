import 'dart:convert';

import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/model/search_model.dart';
import 'package:http/http.dart' as http;

const String  Domin = 'm.ctrip.com';
/**
 * 搜索接口
 */

class SearchDao {
  static Future<SearchModel> fetch(String url) async {
    final response =  await http.get(Uri.http(Domin, 'restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=长城'));
    if(response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return SearchModel.fromJson(result);
    }else{
      Exception('fail to load home_page.json');
    }
  }

}