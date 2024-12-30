import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyPage extends StatelessWidget {
  static const routeName = '/privacy';

  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Política de privacidad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future:
              Future.delayed(const Duration(milliseconds: 150)).then((value) {
            return rootBundle.loadString('assets/md/privacy_policy.md');
          }),
          builder: ((context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Markdown(data: snapshot.data);
            }
            return const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}