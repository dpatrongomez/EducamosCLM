import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MenuCEC extends StatelessWidget {
  final InAppWebViewController controller;

  const MenuCEC({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 80,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 60,
                      child: Image(
                        image: AssetImage('assets/img/logo_android.png'),
                      ),
                    ),
                    Text(
                      "EducamosCLM",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ExpansionTile(
            title: Text('Tramitación por Internet',
                style: TextStyle(color: Colors.white)),
            textColor: Theme.of(context).colorScheme.secondary,
            iconColor: Theme.of(context).colorScheme.secondary,
            collapsedIconColor: Colors.white,
            children: <Widget>[
              ListTile(
                  title: Text('Enviar solicitud',
                      style: TextStyle(color: Colors.white60)),
                  leading: Icon(
                    Icons.outbox,
                    color: Colors.white60,
                  ),
                  onTap: () => openOptionMenu('RegTraDis', '1000072', context)),
              ListTile(
                  title: Text('Trámites del centro',
                      style: TextStyle(color: Colors.white60)),
                  leading: Icon(
                    Icons.gavel,
                    color: Colors.white60,
                  ),
                  onTap: () =>
                      openOptionMenu('RegTraCenCiu', '1000142', context)),
            ],
          ),
          ExpansionTile(
            title: Text('Mis trámites', style: TextStyle(color: Colors.white)),
            textColor: Theme.of(context).colorScheme.secondary,
            iconColor: Theme.of(context).colorScheme.secondary,
            collapsedIconColor: Colors.white,
            children: <Widget>[
              ExpansionTile(
                title: Text('Mis solicitudes',
                    style: TextStyle(color: Colors.white70)),
                textColor: Theme.of(context).colorScheme.secondary,
                iconColor: Theme.of(context).colorScheme.secondary,
                collapsedIconColor: Colors.white70,
                children: <Widget>[
                  ListTile(
                      title: Text('Mis solicitudes',
                          style: TextStyle(color: Colors.white60)),
                      leading: Icon(
                        Icons.list,
                        color: Colors.white60,
                      ),
                      onTap: () =>
                          openOptionMenu('RegSol', '1000147', context)),
                  ListTile(
                      title: Text('Pendientes de Firma',
                          style: TextStyle(color: Colors.white60)),
                      leading: Icon(
                        Icons.draw,
                        color: Colors.white60,
                      ),
                      onTap: () =>
                          openOptionMenu('RegSolPenFir', '1000146', context)),
                ],
              ),
              ExpansionTile(
                title: Text('Mis autorizaciones',
                    style: TextStyle(color: Colors.white70)),
                textColor: Theme.of(context).colorScheme.secondary,
                iconColor: Theme.of(context).colorScheme.secondary,
                collapsedIconColor: Colors.white70,
                children: <Widget>[
                  ListTile(
                      title: Text('Firmas de autorización',
                          style: TextStyle(color: Colors.white60)),
                      leading: Icon(
                        Icons.folder_shared,
                        color: Colors.white60,
                      ),
                      onTap: () =>
                          openOptionMenu('RegFirAut', '1000118', context)),
                ],
              ),
            ],
          ),
          ListTile(
              title: Text('Mis expedientes',
                  style: TextStyle(color: Colors.white)),
              leading: Icon(
                Icons.library_books,
                color: Colors.white,
              ),
              onTap: () =>
                  openOptionMenu('RegCandidatosExp', '1000158', context)),
          ListTile(
              title: Text('Mis datos', style: TextStyle(color: Colors.white)),
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onTap: () => openOptionMenu('DetMisDat', '1000075', context)),
        ],
      ),
    );
  }

  void openOptionMenu(String llamada, String cod, context) {
    controller.evaluateJavascript(
        source:
            "window.frames[1].document.querySelectorAll('frameset')[0].prepend(menu);");
    Future.delayed(Duration(milliseconds: 500), () {
      controller.evaluateJavascript(
          source:
              "window.frames[1].menu.llamadaDesdeMenu('$llamada', '$cod', ''); window.frames[1].document.querySelectorAll('frameset')[1].remove();");
    });
    Navigator.of(context).pop();
  }
}
