
import 'package:flutter/material.dart';

enum SearchBarType{home,normal,homeLight}  //枚举三种类型 //首页的，搜索页的，高亮的

//自定义searchbar
class SearchBar extends StatefulWidget{

  final bool enabled;                     //是否启动搜索
  final bool hideLeft;                    //是否隐藏左侧按钮
  final SearchBarType searchBarType;      //两种类型：首页的，和搜索页面的
  final String hint;                      //默认的提示的文案
  final String defaultText;               //默认的文本
  final void Function() leftButtonClick;  //左侧按钮点击回调
  final void Function() ringhtButtonClick;//右侧按钮点击回调
  final void Function() speakClick;       //语音输入点击回调
  final void Function() inputBoxClick;    //文本输入点击回调
  final ValueChanged<String> onChanged;//内容变化的回调


  const SearchBar({
          Key key,
          this.enabled =true,
          this.hideLeft,
          this.searchBarType = SearchBarType.normal,
          this.hint,
          this.defaultText,
          this.leftButtonClick,
          this.ringhtButtonClick,
          this.speakClick,
          this.inputBoxClick,
          this.onChanged
      }):super(key: key);

  @override
  _SearchBarState createState() =>_SearchBarState();

}

class _SearchBarState extends State<SearchBar>{
  bool showClear = false;                                           //是否显示clear按钮，默认不显示
  final TextEditingController _controller = TextEditingController();//controller是显示textfield变化

  /**
  * 将语音输入的文本带过去，带到输入searchbar中
  */
  @override
  void initState() {
    if(widget.defaultText!= null){
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal?_genNprmalSearch():_genHomeSearch();
  }

  _genNprmalSearch() {
     return Container(
       child: Row(
         children: [
           _wrapTap(
               Container(
                 padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
                 child: widget?.hideLeft??false?null:Icon(Icons.arrow_back,color: Colors.grey,size: 26),
               ), widget.leftButtonClick),
           Expanded(
               flex: 1,
               child: _inputBox()),
           _wrapTap(Container(
               padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
               child: Text('搜索',style: TextStyle(fontSize: 17,color: Colors.blue)),
           ), widget.ringhtButtonClick)
         ],
       ),
     );
  }
  _genHomeSearch(){
    Color _homeFontColor = Colors.grey;
    return Container(
      child: Row(
        children: [
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(6, 5, 5, 5),
                child: Row(
                  children: [
                    Text('上海',style: TextStyle(color: _homeFontColor,fontSize: 14),),
                    Icon(Icons.expand_more,color: _homeFontColor,size: 22,)
                  ],
                ),
              ), widget.leftButtonClick),
          Expanded(
              flex: 1,
              child: _inputBox()),
          _wrapTap(Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Icon(Icons.comment,color: _homeFontColor,size: 26),
          ), widget.ringhtButtonClick)
        ],
      ),
    );
  }

  _wrapTap(Widget widget,void Function() callback){
    return GestureDetector(
      onTap: (){
        if(callback!= null) callback();
      },
      child: widget,
    );
  }

  _inputBox() {
     Color inputColor;
     if(widget.searchBarType == SearchBarType.home){
       inputColor = Colors.white;
     }else{
       inputColor = Color(int.parse('0xffEDEDED'));
     }
     return Container(
       height: 30,
       padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
       decoration: BoxDecoration(
         color: inputColor,
         borderRadius: BorderRadius.circular(widget.searchBarType == SearchBarType.normal?5:15)
       ),
       child: Row(
         children: [
           Icon(
            Icons.search,
             size: 28,
             color: widget.searchBarType == SearchBarType.normal?Color(0xffA9A9A9):Colors.blue,
           ),
           Expanded(
             flex: 1,
             child: widget.searchBarType == SearchBarType.normal?TextField(
               controller: _controller,
               onChanged: _onchange,
               autofocus: true,
               decoration: InputDecoration(
                   // contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                   border: InputBorder.none,
                   hintText: widget.hint??'',
                   hintStyle: TextStyle(fontSize: 15)
               ),
               style: TextStyle(
                 fontSize: 20,
                 color: Colors.black,
                 fontWeight: FontWeight.w300,
               ),
             ):_wrapTap(Container(
               child: Text(widget.defaultText,style: TextStyle(fontSize: 13,color: Colors.grey)),
             ), widget.inputBoxClick),
           ),
           !showClear?_wrapTap(Icon(Icons.mic, size: 22, color: widget.searchBarType == SearchBarType.normal ? Colors.blue:Colors.grey,), widget.speakClick) 
               :_wrapTap(Icon(Icons.clear,size: 22,color: Colors.grey), () {
                 setState(() {
                   _controller.clear();
                 });
                 _onchange('');
           })
               
         ],
       ),
     );
  }

  _onchange(String text) {
    if(text.length > 0){
      setState(() {
        showClear = true;
      });
    }else{
      setState(() {
        showClear = false;
      });
    }
    if(widget.onChanged!= null){
      widget.onChanged(text);
    }
  }

}
