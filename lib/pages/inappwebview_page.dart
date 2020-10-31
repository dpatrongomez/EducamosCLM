import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewPage extends StatefulWidget {
  @override
  _InAppWebViewPageState createState() => _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  //InAppWebViewController _webViewController;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    final String _url = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: Text('EducamosCLM'),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {
          //       if (_webViewController != null) {
          //         _webViewController.goBack();
          //       }
          //     },
          //   ),
          //   IconButton(
          //     icon: Icon(Icons.arrow_forward),
          //     onPressed: () {
          //       if (_webViewController != null) {
          //         _webViewController.goForward();
          //       }
          //     },
          //   ),
          //   IconButton(
          //     icon: Icon(Icons.refresh),
          //     onPressed: () {
          //       if (_webViewController != null) {
          //         _webViewController.reload();
          //       }
          //     },
          //   )
          // ],
        ),
        body: Column(children: <Widget>[
          Container(
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container()),
          Expanded(
            child: InAppWebView(
              initialUrl: _url,
              initialOptions: InAppWebViewGroupOptions(
                android: AndroidInAppWebViewOptions(
                    allowFileAccess: true,
                    displayZoomControls: true,
                    cacheMode: AndroidCacheMode.LOAD_DEFAULT),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                //_webViewController = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
          ),
        ]));
  }
}
