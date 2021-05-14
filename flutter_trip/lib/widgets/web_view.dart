import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/**
 * webview封装
 * 借助于插件，需要导入：flutter_webview_plugin: ^0.3.10+1
 * #webview跳转
 *
 */
//携程首页白名单
const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

// ignore: must_be_immutable
class WebView extends StatefulWidget {
  String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  WebView(
      {this.url,
        this.statusBarColor,
        this.title,
        this.hideAppBar,
        this.backForbid = false}) {
    if (url != null && url.contains('ctrip.com')) {
      //fix 携程H5 http://无法打开问题
      url = url.replaceAll("http://", 'https://');
    }
  }

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final webviewReference = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;                  //url改变监听

  /**
   * //url状态监听
   */
  // t = WebViewState.shouldStart;
  //
  // t = WebViewState.startLoad;
  //
  // t = WebViewState.finishLoad;
  //
  // t = WebViewState.abortLoad;

  StreamSubscription<WebViewStateChanged> _onStateChanged;

  /**
   * 加载错误
   */
  StreamSubscription<WebViewHttpError> _onHttpError;

  /**
   *
   */
  bool exiting = false;

  @override
  void initState() {
    super.initState();
    webviewReference.close();
    _onUrlChanged = webviewReference.onUrlChanged.listen((String url) {});
    _onStateChanged =
        webviewReference.onStateChanged.listen((WebViewStateChanged state) {
          print(state.url);
          print(widget.url);
          switch (state.type) {
            case WebViewState.startLoad:
              if (_isToMain(state.url) && !exiting) {
                if (widget.backForbid) {
                  webviewReference.launch(widget.url);
                } else {
                  Navigator.pop(context);
                  exiting = true;
                }
              }
              break;
            default:
              break;
          }
        });
    _onHttpError =
        webviewReference.onHttpError.listen((WebViewHttpError error) {
          print(error);
        });
  }

  /**
   * 是否包含在白名单中
   */

  _isToMain(String url) {
    bool contain = false;
    for (final value in CATCH_URLS) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  @override
  void dispose() {
    _onStateChanged.cancel();
    _onUrlChanged.cancel();
    _onHttpError.cancel();
    webviewReference.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    /**
     * 判断状态栏颜色
     *
     */
    if (statusBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(
            /**
             * Color（），接受int， 0xff表示透明度+statusBarColorStr == 'ffffff'
             */
              Color(int.parse('0xff' + statusBarColorStr)), backButtonColor),
          Expanded(
              child: WebviewScaffold(
                userAgent: 'null',//防止携程H5页面重定向到打开携程APP ctrip://wireless/xxx的网址
                url: widget.url,
                withZoom: true,
                withLocalStorage: true,
                hidden: true,
                initialChild: Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  _appBar(Color backgroundColor, Color backButtonColor) {
    /**
     * hideAppBar
     * 如果隐藏appbar 则返回状态栏
     * 否则返回状态栏widget
     */


    /**
     * stack绝对布局，各顾各，不用彼此参考
     */
    if (widget.hideAppBar ?? false) {
      return Container(
        color: backgroundColor,
        height: 30,
      );
    }
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: backButtonColor,
                  size: 26,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.title ?? '',
                  style: TextStyle(color: backButtonColor, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}