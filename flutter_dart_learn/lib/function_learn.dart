

class TestFunction{
  FunctionLearn learn;

  test(){
    learn = FunctionLearn();
    learn.add(100, 200);
    // learn._printFunc("haha);
    learn.priintList();

  }

}

class FunctionLearn{

  //
  int add(int num1,int num2){
    return num1 + num2;
  }
  //私有方法
  //私自有类
  //私有变量
  _printFunc(String msg){
    print(msg);
  }

  //匿名方法
   priintList(){
    List liist = [1,2,3,4,5,6,7,89,0];
    liist.forEach((el) {
      print(el);
    });
   }
}