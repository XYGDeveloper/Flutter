import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//白名单
const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

class Webview extends StatefulWidget{

   String url;
   String statusBarColor;
   String title;
   bool hideAppBar;
   bool backForbid;


   Webview({this.url, this.statusBarColor, this.title, this.hideAppBar,
     this.backForbid = false});
   },

  @override
  _WebviewState createState() =>_WebviewState();

}

class _WebviewState extends State<Webview>{

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged>  _onStateChanged;
  StreamSubscription<WebViewStateChanged>  _onHttpError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterWebviewPlugin.close();
    //当url发生改变监听
    _onUrlChanged =  flutterWebviewPlugin.onUrlChanged.listen((url) {
      print(url);
    });

    //
    _onStateChanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
          // Switch (state.type)
          //   case:WebViewState.startLoad
          //   case:WebViewState.finishLoad
          //
    });

    flutterWebviewPlugin.onHttpError.listen((error) {
      print(error);
    });



  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterWebviewPlugin.dispose();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(backgrouncolor),
    );
  }

  _appBar(backgrouncolor) {

  }

}