import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:matematika/stateManagment/matematika_state.dart';
import 'package:matematika/reusableWidget/animations/fade_in.dart';
import 'package:matematika/reusableWidget/animations/blink_widget.dart';
import 'package:numberpicker/numberpicker.dart';

class MatematikaPage extends StatefulWidget {
  @override
  _MatematikaPageState createState() => _MatematikaPageState();
}

class _MatematikaPageState extends State<MatematikaPage> {


  Key _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _userSum = TextEditingController();
  bool _visible = true;

 // _resolveMaxNumber(int level){
   // int _maxNumber = level*20;
    //List items = List<int>.generate(_maxNumber, (i) => i);
    //Navigator.of(context).pushNamed("myNumberPicker",arguments: items);


  //}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.deepOrange,
                  elevation: 20,
                  child: Consumer<Matematika>(builder: (context, data, child) {
                    return Container(
                        width: 150,
                        height: 80,
                        child: Center(
                            child: Text(
                          "Points:${data.points.toString()}",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )));
                  })),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.deepOrange,
                  elevation: 20,
                  child: Consumer<Matematika>(builder: (context, data, child) {
                    return Container(
                        width: 150,
                        height: 80,
                        child: Center(
                            child: Text(
                          "Level:${data.level.toString()}",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )));
                  })),
            ],
          ),
          FadeIn(
              6,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 20,
                      child:
                          Consumer<Matematika>(builder: (context, data, child) {
                        return Container(
                            width: 120,
                            height: 100,
                            child: Center(
                                child: Text(
                              data.firstNumber.toString(),
                              style: TextStyle(
                                  fontSize: 90,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )));
                      })),
                ],
              )),
          FadeIn(
              8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 20,
                    child: Container(
                        width: 100,
                        height: 100,
                        child: Center(
                            child: Text(
                          "+",
                          style: TextStyle(
                              fontSize: 90,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ))),
                  ),
                ],
              )),
          FadeIn(
              10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 20,
                      child:
                          Consumer<Matematika>(builder: (context, data, child) {
                        return Container(
                            width: 120,
                            height: 100,
                            child: Center(
                                child: Text(
                              data.secondNumber.toString(),
                              style: TextStyle(
                                  fontSize: 90,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )));
                      })),
                ],
              )),
          FadeIn(
              12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 20,
                      child:
                          Consumer<Matematika>(builder: (context, data, child) {
                        return AnimatedOpacity(
                          opacity: _visible ? 1.0 : 0.0,
                          duration: Duration(seconds: 15),
                          child: Container(
                              width: 100,
                              height: 100,
                              child: Center(
                                  child: Text(
                                "=",
                                style: TextStyle(
                                    fontSize: 90,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ))),
                        );
                      })),
                ],
              )),
          FadeIn(
            14,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FadeIn(
                  10,
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 20,
                    child:
                        Consumer<Matematika>(builder: (context, data, child) {
                      return InkWell(
                          onTap: () =>
                          //_resolveMaxNumber(data.level),
                           //   Navigator.of(context).pushNamed("myNumberPicker", arguments: _resolveMaxNumber(data.level)),
                           Navigator.pushNamed(context, "myNumberPicker"),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: BlinkWidget(
                                interval: 500,
                                children: <Widget>[
                                  Icon(Icons.notifications_active,
                                      color: Colors.transparent),
                                  Text(
                                    "?",
                                    style: TextStyle(
                                        fontSize: 90,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    }),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}



void _showDialog(context, items) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Alert Dialog title"),
        content: new Text("Alert Dialog content"),
        //ListView.builder(
            //itemCount: items.length,
            //itemBuilder: (context, index) {
              //return ListTile(
            //    title: Text('${items[index]}'),
          //    );
        //    }),
        actions: <Widget>[
          ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        return ListTile (title: Text("${items[index]}"));
      }),
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
