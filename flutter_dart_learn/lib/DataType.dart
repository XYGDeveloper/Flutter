
import 'package:flutter/material.dart';

class DataTYpe extends StatefulWidget {
  @override
  _DataTYpeState createState() => _DataTYpeState();
}

class _DataTYpeState extends State<DataTYpe> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    _listType();
    _mapType();
    _tips();
    return Container();
  }

  void _numType() {
    //num类型包括int和double
    num num1 = -1.0;
    num num2 = 12;
    int a1 = 100;
    double a2 = 12.44;
    print("num1:$num1  num2:$num2   a1:$a1    a2:$a2");

    print(num1.toInt());
    print(num2.toDouble());
    print(a1.toString());
    print(num1.abs());
    print(a2.toInt());
  }

  void _stringType() {
    String str1 = "hahahahhaha";
    String str2 = 'ggggggggg';
    String str3 = str1 + " " + str2;
    String str4 = 'str3: $str1 str4: $str2';
    print(str3);
    print(str4);
    print(str4.substring(1,4));
    print(str4.contains("g"));
    print(str4.replaceAll("g", "h"));
    print(str4);

  }

  void _boolType() {
    bool success = true;
    bool fail = false;
    print(success);
    print(fail);
    print(success || fail);
    print(success && fail);
  }

  void _listType() {
    List list0 = [];
    print(list0);
    List list1 = [1,2,3,4,5,6,7,8,9,0];
    print(list1);
    List<int> list2 = [];
    list2.add(345);
    list2.insert(1, 666);
    list2.remove(666);
    print(list2);
    list2.addAll([1,3,6,7]);
    List<dynamic> list3 = [];
    for(int i = 0;i< list1.length;i++){
      print(list1[i]);
    }

    for(var item in list1){
      print(item);
    }

    list1.forEach((element) {
      print(element);
    });

  }

  void _mapType() {
    Map map0 = {};
    map0['name'] = "zhangsan";
    map0['age'] = 25;
    print(map0);
    Map map1 = {
      "name":"lisi",
      "age":50
    };
    print(map1);
    map1.remove("age");
    Map<String,int> map2 = {
      "name1":345,
      "name2":567,
      "name3":567,
      "name4":789
    };

    map2.forEach((key, value) {
      print("$key, $value");
    });
    // var key;
    // var value;
    // for((key,value) in map2){
    //   print(key);
    //   print(value);
    // };

    // Map map3 =  map2.forEach((key, value) {
    //   return MapEntry(value, key);
    // });
    //
    // print(map3);

    for(var key in map2.keys){
      print(key);
      print(map2[key]);
      print("key:$key value:${map2[key]}");
    };


  }

  void _tips() {
    dynamic name = "kkk";
    name = 123;
    print(name.runtimeType);

    var tap = 123;
    // tap = "hhhh";
    print(tap.runtimeType);

    Object k  = "gggg";
    k.toString();
    print(k.runtimeType);

  }



}
