import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

import 'pages/aulavirtual_page.dart';
import 'pages/inappwebview_page.dart';
import 'pages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.storage.request();
  await FlutterDownloader.initialize(debug: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EducamosCLM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue,
            ).copyWith(
              primary: Color(0xff012d5a),
              secondary: Colors.orangeAccent,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomePage(),
          'webview': (BuildContext context) => InAppWebViewPage(),
          'virtual': (BuildContext context) => AulaVirtualPage(),
        });
  }
}
