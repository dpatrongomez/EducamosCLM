import 'package:EducamosCLM/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridVirtual extends StatelessWidget {
  final List<Item> myList;

  const GridVirtual({@required this.myList});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GridView.count(
          childAspectRatio: 1,
          shrinkWrap: true,
          padding: EdgeInsets.all(16.0),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'webview', arguments: data.url);
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
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}
