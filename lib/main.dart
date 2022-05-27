import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'pages/aulavirtual_page.dart';
import 'pages/inappwebview_page.dart';
import 'pages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  FlutterDownloader.registerCallback(downloadCallback);
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(MyApp());
}

void downloadCallback(String id, DownloadTaskStatus status, int progress) {
  final SendPort send =
      IsolateNameServer.lookupPortByName('downloader_send_port')!;
  send.send([id, status, progress]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;

      if (lightDynamic != null && darkDynamic != null) {
        // On Android S+ devices, use the provided dynamic color scheme.
        // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
        lightColorScheme = lightDynamic.harmonized();
        // (Optional) Customize the scheme as desired. For example, one might
        // want to use a brand color to override the dynamic [ColorScheme.secondary].
        lightColorScheme =
            lightColorScheme.copyWith(primary: Color(0xff012d5a), secondary: Colors.orangeAccent);
        // (Optional) If applicable, harmonize custom colors.
        //lightCustomColors = lightCustomColors.harmonized(lightColorScheme);

        // Repeat for the dark color scheme.
        darkColorScheme = darkDynamic.harmonized();
        darkColorScheme =
            darkColorScheme.copyWith(primary: Color(0xff012d5a), secondary: Colors.orangeAccent);
        // darkCustomColors = darkCustomColors.harmonized(darkColorScheme);

        //_isDemoUsingDynamicColors = true; // ignore, only for demo purposes
      } else {
        // Otherwise, use fallback schemes.
        lightColorScheme = ColorScheme.fromSeed(
          seedColor: Color(0xff012d5a),
          primary: Color(0xff012d5a),
          secondary: Colors.orangeAccent
        );
        darkColorScheme = ColorScheme.fromSeed(
          seedColor: Color(0xff012d5a),
          brightness: Brightness.dark,
          primary: Color(0xff012d5a),
          secondary: Colors.orangeAccent
        );
      }
      return MaterialApp(
          title: 'EducamosCLM',
          debugShowCheckedModeBanner: false,
         theme: ThemeData(
            colorScheme: lightColorScheme,
            //extensions: [lightCustomColors],
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            //extensions: [darkCustomColors],
          ),
          initialRoute: '/',
          routes: {
            '/': (BuildContext context) => HomePage(),
            'webview': (BuildContext context) => InAppWebViewPage(),
            'virtual': (BuildContext context) => AulaVirtualPage(),
          });
    });
  }
}
