
//dart 面向对象
class Student extends Person{
  String _shool;  //作用范围本类
  String country;
  String city;
  String name;
  //set方法
  void set school(String value){
    _shool = value;
  }
  //get方法
  String get school => _shool;

  //静态方法
  static printls(String ss){
    print("print:$ss");
  }
  Student(
      this._shool,
      String name,
      int age,
      {this.city,this.country="china"})
      :name="$country $city", super(name, age);
  //命名构造方法
  Student.withStu(Student stu):super(stu.name,stu.age){
    print("命名构造方法");
  }

  //命名工厂构造方法
  //  factory Student.factory(Student stu){
  //   return Student.withStu(stu.name,stu.age);
  //  }

   @override
  String toString() {
    // TODO: implement toString
    return "name:$name, age:$age, school:$_shool, city:$city, country:$country";
  }

}

//工厂构造方法
class Logger{
  static Logger _logger;
  factory Logger(){
    if(_logger == null){
      _logger = Logger._internal();
    }
    return _logger;
  }
  Logger._internal();
}



class Person {
  String name;
  int age;
  Person(this.name,this.age);

}

//抽象类与抽象方法

class FlutterStudy extends Study{
  @override
  void study() {
    print("学习 flutter");
  }
}

abstract class Study{
  void study();
}

//Mixins
//with后面的类必须是继承object，里面没有super，没有构造方法
abstract class Test extends Student with Study{
  Test(String shool, String name, int age) : super(shool, name, age);
  @override
  void study() {

  }
}
//