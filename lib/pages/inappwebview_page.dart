import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewPage extends StatefulWidget {
  @override
  _InAppWebViewPageState createState() => _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  late InAppWebViewController _webViewController;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    final String _url = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('EducamosCLM'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
              child: progress < 1.0
                  ? LinearProgressIndicator(
                      value: progress,
                      color: Theme.of(context).colorScheme.secondary,
                    )
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
            ),
          )
        ],
      ),
    );
  }
}
