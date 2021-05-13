
/**
 * 首页通用model
 */

// "icon": "http://www.devio.org/io/flutter_app/img/ln_ticket.png",
// "title": "鏀荤暐路鏅偣",
// "url": "https://m.ctrip.com/webapp/you/place/2.html?ishideheader=true&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
// "statusBarColor": "1070b8",
// "hideAppBar": true

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String,dynamic> json){
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> map = Map();
      map['icon'] = this.icon;
      map['title'] = this.title;
      map['url'] = this.url;
      map['statusBarColor'] = this.statusBarColor;
      map['hideAppBar'] = this.hideAppBar;
      return map;
  }

}