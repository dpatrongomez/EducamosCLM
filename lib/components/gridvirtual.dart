import '../model/item_model.dart';
import 'package:flutter/material.dart';

class GridVirtual extends StatelessWidget {
  final List<Item> myList;

  const GridVirtual({required this.myList});

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
              child: Card(
                 shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),

                color: Theme.of(context).colorScheme.secondary,
                elevation: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img!,
                      width: 42,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}
