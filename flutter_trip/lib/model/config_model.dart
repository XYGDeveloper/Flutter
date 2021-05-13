
/**
 * 首页搜索model
 */

// searchUrl

class ConfigModel {

  final String searchUrl;

  ConfigModel({this.searchUrl});
  factory ConfigModel.fromJson(Map<String,dynamic> json){
    return ConfigModel(
      searchUrl: json['searchUrl'],
    );
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> map = Map();
    map['searchUrl'] = this.searchUrl;
    return map;
  }

}
