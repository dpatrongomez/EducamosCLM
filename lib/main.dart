import 'dart:io';
import 'dart:ui';

import 'package:educamosclm/pages/settings/pages/privacy_page.dart';
import 'package:educamosclm/pages/settings/pages/terms_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'package:educamosclm/pages/home_page.dart';
import 'package:educamosclm/pages/inappwebview_page.dart';
import 'package:educamosclm/pages/settings/settings_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  FlutterDownloader.registerCallback(downloadCallback);
  if (Platform.isAndroid) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(MyApp());
}

void downloadCallback(
  String id,
  int status,
  int progress,
) {
  IsolateNameServer.lookupPortByName('downloader_send_port')
      ?.send([id, status, progress]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        lightColorScheme = lightColorScheme.copyWith(
            primary: Color(0xff012d5a), secondary: Colors.orangeAccent);
        // (Optional) If applicable, harmonize custom colors.
        //lightCustomColors = lightCustomColors.harmonized(lightColorScheme);

        // Repeat for the dark color scheme.
        darkColorScheme = darkDynamic.harmonized();
        darkColorScheme = darkColorScheme.copyWith(
            primary: Color(0xff012d5a), secondary: Colors.orangeAccent);
        // darkCustomColors = darkCustomColors.harmonized(darkColorScheme);

        //_isDemoUsingDynamicColors = true; // ignore, only for demo purposes
      } else {
        // Otherwise, use fallback schemes.
        lightColorScheme = ColorScheme.fromSeed(
            seedColor: Color(0xff012d5a),
            primary: Color(0xff012d5a),
            secondary: Colors.orangeAccent);
        darkColorScheme = ColorScheme.fromSeed(
            seedColor: Color(0xff012d5a),
            primary: Color(0xff012d5a),
            brightness: Brightness.dark,
            secondary: Colors.orangeAccent);
      }
      return MaterialApp(
          title: 'EducamosCLM',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: lightColorScheme,
            appBarTheme: AppBarTheme(
                color: lightColorScheme.primary,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                iconTheme: IconThemeData(color: Colors.white)),
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            appBarTheme: AppBarTheme(
                color: darkColorScheme.primary,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                iconTheme: IconThemeData(color: Colors.white)),
          ),
          initialRoute: '/',
          routes: {
            '/': (BuildContext context) => HomePage(),
            'webview': (BuildContext context) => InAppWebViewPage(),
            '/settings': (BuildContext context) => SettingsPage(),
            PrivacyPage.routeName: (context) => const PrivacyPage(),
            TermsPage.routeName: (context) => const TermsPage(),
          });
    });
  }
}
