import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:matematika/stateManagment/matematika_state.dart';
import 'package:provider/provider.dart';

class AnswerNumber extends StatefulWidget {
  @override
  _AnswerNumberState createState() => _AnswerNumberState();
}

class _AnswerNumberState extends State<AnswerNumber> {
  int _userInput = 10;
  

  _resolvePop(){
    Provider.of<Matematika>(context,listen: false).checkSum(_userInput, context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OutlineButton(

      onPressed: () =>Navigator.pop(context,_resolvePop()),

      child: NumberPicker.integer(

        itemExtent: 300.0,
        highlightSelectedValue: true,
          initialValue: _userInput,
          minValue: 0,
          maxValue: 200,
          onChanged: (newValue) => setState(() => _userInput = newValue)),
    );
  }
}
