import 'package:EducamosCLM/pages/aulavirtual_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/webview_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EducamosCLM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomePage(),
          'webview': (BuildContext context) => WebViewPage(),
          'virtual': (BuildContext context) => AulaVirtualPage(),
        });
  }
}
