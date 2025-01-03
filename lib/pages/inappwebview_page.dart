import 'dart:io';
import 'package:educamosclm/components/menu_cec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class InAppWebViewPage extends StatefulWidget {
  const InAppWebViewPage({super.key});

  @override
  _InAppWebViewPageState createState() => _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  late InAppWebViewController _webViewController;
  final CookieManager _cookieManager = CookieManager.instance();
  HttpAuthCredentialDatabase httpAuthCredentialDatabase =
      HttpAuthCredentialDatabase.instance();
  double progress = 0;
  String actualUrl = '';
  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: Text('EducamosCLM'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => Navigator.of(context).pop(),
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                if (actualUrl.contains('cerbero.jccm.es/auth/')) {
                  return Navigator.of(context).pop();
                }
                if (actualUrl.contains('/accesoeducamos/')) {
                  _webViewController.evaluateJavascript(
                      source:
                          'javascript:document.querySelector("#userMenu").click()');

                  _webViewController.evaluateJavascript(
                      source:
                          'javascript:document.querySelector("educamosclmfront-toolbar-access").querySelector("#logout").click()');
                } else {
                  _webViewController.evaluateJavascript(
                      source:
                          'javascript:top.document.location.replace("./Logout.jsp")');
                }
              },
            ),
          ],
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
                initialUrlRequest: URLRequest(url: WebUri(url)),
                initialSettings: InAppWebViewSettings(
                  useHybridComposition: true,
                  domStorageEnabled: true,
                  allowFileAccess: true,
                  displayZoomControls: true,
                  cacheMode: CacheMode.LOAD_DEFAULT,
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  _webViewController = controller;
                },
                onProgressChanged: (controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
                onDownloadStartRequest: (controller, url) {
                  download(url);
                },
                onLoadStop: (controller, uri) async {
                  _webViewController = controller;
                  if (uri.toString().contains('/secvir/jsp/CEC.jsp')) {
                    // Secretaría Virtual
                    String javascriptMetaString =
                        "var meta = document.createElement('meta'); meta.setAttribute( 'name', 'viewport' ); meta.setAttribute( 'content', 'width = device-width, initial-scale = 1.0, user-scalable = yes' ); document.getElementsByTagName('head')[0].appendChild(meta)";
                    _webViewController.evaluateJavascript(
                        source: javascriptMetaString);
                    String responsiveAndMenu =
                        "window.frames[1].document.querySelectorAll('frameset')[0].cols = '100%'; let menu = window.frames[1].document.querySelectorAll('frameset')[1]; window.frames[1].document.querySelectorAll('frameset')[1].remove(); window.frames.centro[1].document.querySelector('div.carousel-caption.d-none.d-md-block').attributes[0].value = 'carousel-caption d-md-block'";
                    _webViewController.evaluateJavascript(
                        source: responsiveAndMenu);
                  }
                },
                onPermissionRequest: (controller, request) async {
                  return PermissionResponse(
                      resources: request.resources,
                      action: PermissionResponseAction.GRANT);
                },
                onUpdateVisitedHistory: (controller, url, isReload) {
                  setState(() {
                    actualUrl = url.toString();
                  });
                },
              ),
            )
          ],
        ),
        drawer: actualUrl.contains('/secvir/jsp/CEC.jsp')
            ? MenuCEC(
                controller: _webViewController,
              )
            : null);
  }

  Future<String?> _findLocalPath() async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      externalStorageDirPath = directory?.path;
    }
    return externalStorageDirPath;
  }

  void download(DownloadStartRequest request) async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    String localPath = (await _findLocalPath())!;
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    List<Cookie> cookies = await _cookieManager.getCookies(url: request.url);
    String cookiesString = '';
    for (Cookie cookie in cookies) {
      cookiesString += '${cookie.name}=${cookie.value};';
    }
    await FlutterDownloader.enqueue(
      headers: {
        HttpHeaders.cookieHeader: cookiesString,
        HttpHeaders.userAgentHeader: request.userAgent!,
        HttpHeaders.contentTypeHeader: request.mimeType!,
        HttpHeaders.connectionHeader: 'keep-alive',
        HttpHeaders.acceptEncodingHeader: 'gzip, deflate, br',
      },
      url: request.url.toString(),
      fileName: request.suggestedFilename!.replaceAll(';', ''),
      savedDir: localPath,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification: true,
      saveInPublicStorage: true,
    );
  }
}
