import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridPlataformas extends StatelessWidget {
  final List<Items> myList;
  final String text;
  const GridPlataformas({@required this.myList, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ))),
        Expanded(
          child: GridView.count(
              childAspectRatio: 2,
              padding: EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: 1,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: myList.map((data) {
                return GestureDetector(
                  onTap: () {
                    switch (data.title) {
                      case 'SEGUIMIENTO EDUCATIVO':
                        Navigator.pushNamed(context, 'webview',
                            arguments: 'http://papas.jccm.es/');
                        break;
                      case 'SECRETARÍA VIRTUAL':
                        Navigator.pushNamed(context, 'webview',
                            arguments: 'http://papas.jccm.es/');
                        break;
                      case 'ENTORNO DE APRENDIZAJE':
                        Navigator.pushNamed(context, 'virtual');
                        break;
                      case 'ENTORNO COLABORATIVO':
                        Navigator.pushNamed(context, 'webview',
                            arguments:
                                'https://teams.microsoft.com/?domain_hint=educastillalamancha.es');
                        break;
                      case 'GESTIÓN DE CENTROS':
                        Navigator.pushNamed(context, 'webview',
                            arguments: 'https://delphos.jccm.es/');
                        break;
                      case 'EVALÚA':
                        Navigator.pushNamed(context, 'webview',
                            arguments: 'https://papas.jccm.es/');
                        break;
                      default:
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 5, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                          data.img,
                          width: 42,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          data.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          data.subtitle1,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          data.subtitle2,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          data.subtitle3,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList()),
        ),
      ],
    );
  }
}

class Items {
  String title;
  String subtitle1, subtitle2, subtitle3;
  String event;
  String img;
  Items(
      {this.title,
      this.subtitle1,
      this.subtitle2,
      this.subtitle3,
      this.event,
      this.img});
}
