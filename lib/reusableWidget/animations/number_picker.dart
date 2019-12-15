import 'package:flutter/material.dart';

import 'package:matematika/stateManagment/matematika_state.dart';
import 'package:provider/provider.dart';




class ListNumberDisplay extends StatefulWidget {



  @override
  _ListNumberDisplayState createState() => _ListNumberDisplayState();
}

class _ListNumberDisplayState extends State<ListNumberDisplay> {
  final items = List<int>.generate(100, (i) => i);

   _resolveResult(userInput) {
    Provider.of<Matematika>(context, listen: false)
        .checkSum(userInput, context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: ListView.builder(
            itemCount: items == null ? 0 : items.length,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                onTap: () => Navigator.pop(context, _resolveResult(items[index])),
                //print(listNumbers[index]),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20.0,
                    )
                  ]),
                  padding: EdgeInsets.symmetric(horizontal: 150.0),
                  height: 80,
                  child: Card(
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: new Text(
                            items[index].toString(),
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 40),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
