import '../model/item_model.dart';
import 'package:flutter/material.dart';

class GridPlataformas extends StatelessWidget {
  final List<Item> myList;
  final String text;
  const GridPlataformas({super.key, required this.myList, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                    if (data.url == null) {
                      Navigator.pushNamed(context, 'virtual');
                    } else {
                      Navigator.pushNamed(context, 'webview',
                          arguments: data.url);
                    }
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
                        Image.asset(data.img!,
                            width: 42,
                            color: data.img!.endsWith('.webp')
                                ? null
                                : Theme.of(context).colorScheme.primary),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          data.title!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Column(
                          spacing: 4,
                          children: [
                            Text(
                              data.subtitle1!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600),
                            ),
                            data.subtitle2 != null
                                ? Text(
                                    data.subtitle2!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600),
                                  )
                                : SizedBox(),
                            data.subtitle3 != null
                                ? Text(
                                    data.subtitle2!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600),
                                  )
                                : SizedBox(),
                          ],
                        )
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
