

import 'package:flutter_dart_learn/OOP_learn.dart';

class testGeneic{
  
  void TestGeneic(){
    Cache<String> cache = Cache();
    cache.setItem("key", "value");
    print(cache.getItem("key"));
    //
    Cache<int> cache1 = Cache();
    cache1.setItem("key1", 1024);
    print(cache1.getItem("key1"));
    //
    Member<Student> memeber = Member(Student("qinghua", "name", 39));
    memeber.printstu();

}
}

class Cache<T> {
  static final Map<String,Object> _cache = Map();
   void  setItem(String key,T value){
    _cache[key] = value;
  }

  T  getItem(String key){
    return _cache[key];
  }

}

//泛性约束
class Member<T extends Person> {
  T _person;
  Member(this._person){
    print(_person);
  }

  String printstu(){
    return "${_person.name}";
  }


}
