import 'package:flutter/material.dart';
import 'package:educamosclm/components/card_with_children.dart';
import 'package:educamosclm/components/custom_list_tile.dart';
import 'package:educamosclm/pages/settings/pages/privacy_page.dart';
import 'package:educamosclm/pages/settings/pages/terms_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      body: ListView(
        children: <Widget>[
          CardWithChildren(
            title: 'Privacidad',
            children: <Widget>[
              CustomListTile(
                title: 'Política de privacidad',
                icon: Icons.privacy_tip,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PrivacyPage.routeName,
                  );
                },
              ),
              CustomListTile(
                title: 'Términos y condiciones',
                icon: Icons.file_copy,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    TermsPage.routeName,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
