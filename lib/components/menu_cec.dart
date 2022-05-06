import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MenuCEC extends StatelessWidget {
  final InAppWebViewController controller;

  const MenuCEC({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ExpansionTile(
            title: Text('Tramitación por Internet'),
            children: <Widget>[
              ListTile(
                  title: Text('Enviar solicitud '),
                  onTap: () => openOptionMenu('RegTraDis', '1000072', context)),
              ListTile(
                  title: Text('Trámites del centro'),
                  onTap: () =>
                      openOptionMenu('RegTraCenCiu', '1000142', context)),
            ],
          ),
          ExpansionTile(
            title: Text('Mis trámites'),
            children: <Widget>[
              ExpansionTile(
                title: Text('Mis solicitudes'),
                children: <Widget>[
                  ListTile(
                      title: Text('Mis solicitudes'),
                      onTap: () =>
                          openOptionMenu('RegSol', '1000147', context)),
                  ListTile(
                      title: Text('Pendientes de Firma'),
                      onTap: () =>
                          openOptionMenu('RegSolPenFir', '1000146', context)),
                ],
              ),
              ExpansionTile(
                title: Text('Mis autorizaciones'),
                children: <Widget>[
                  ListTile(
                      title: Text('Firmas de autorización'),
                      onTap: () =>
                          openOptionMenu('RegFirAut', '1000118', context)),
                ],
              ),
            ],
          ),
          ListTile(
              title: Text('Mis expedientes'),
              onTap: () =>
                  openOptionMenu('RegCandidatosExp', '1000158', context)),
          ListTile(
              title: Text('Mis datos'),
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
