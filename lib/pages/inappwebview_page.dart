import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';

class InAppWebViewPage extends StatefulWidget {
  @override
  _InAppWebViewPageState createState() => _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  late InAppWebViewController _webViewController;
  CookieManager _cookieManager = CookieManager.instance();
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    final String _url = ModalRoute.of(context)!.settings.arguments as String;
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
            initialUrlRequest: URLRequest(url: Uri.parse(_url)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useOnDownloadStart: true,
                useShouldOverrideUrlLoading: true,
              ),
              android: AndroidInAppWebViewOptions(
                  useHybridComposition: true,
                  domStorageEnabled: true,
                  allowFileAccess: true,
                  displayZoomControls: true,
                  cacheMode: AndroidCacheMode.LOAD_DEFAULT),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
            },
            onProgressChanged: (controller, int progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
            onLoadStop: (controller, uri) async {
              List<Cookie> cookies = await _cookieManager.getCookies(url: uri!);
              cookies.forEach((cookie) {
                print(cookie.name + " " + cookie.value);
              });
            },
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              var uri = navigationAction.request.url!;
              if (uri.toString().endsWith(".pdf") ||
                  uri.toString().endsWith(".doc") ||
                  uri.toString().endsWith(".docx") ||
                  uri.toString().endsWith(".zip")) {
                download(uri);
                return NavigationActionPolicy.CANCEL;
              }
              return NavigationActionPolicy.ALLOW;
            },
            onLoadStart: (controller, uri) {
              if (uri.toString().endsWith(".pdf") ||
                  uri.toString().endsWith(".doc") ||
                  uri.toString().endsWith(".docx") ||
                  uri.toString().endsWith(".zip")) {
                // put this check here if the first url contains your xml file.
                // Instead, for subsequent requests, you can use shouldOverrideUrlLoading event.
                download(uri!);
              }
            },
            onDownloadStart: (controller, uri) async {
              download(uri);
            },
          )),
        ]));
  }

  void download(Uri uri) async {
    List<Cookie> cookies = await _cookieManager.getCookies(url: uri);
    Map<String, String> header =
        Map.fromIterable(cookies, key: (e) => e.name, value: (e) => e.value);

    print('SALUDOS ${uri.toString().endsWith(".pdf")}');
    final taskId = await FlutterDownloader.enqueue(
      url: uri.toString(),
      headers: header,

      savedDir: (await getExternalStorageDirectory())!.path,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }
}
