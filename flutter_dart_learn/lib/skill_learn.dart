void main(){
  List list;
  //weikong判断
  print(list?.length);

  //设置缺省值
  print(list.length??0);

  list.add(0);
  list.add('');
  list.add(null);
  if(list[0] == '' || list[0]==null || list[0] == 0){
    print("object");
  }

  //or
  if([0,'',null].contains(list[0])){
    print("object");
  }

}