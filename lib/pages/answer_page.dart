import 'dart:math';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:matematika/stateManagment/matematika_state.dart';
import 'package:provider/provider.dart';

class AnswerNumber extends StatefulWidget {
  @override
  _AnswerNumberState createState() => _AnswerNumberState();
}

class _AnswerNumberState extends State<AnswerNumber> {
  int _userInput;


  _resolveResult() {
    Provider.of<Matematika>(context, listen: false)
        .checkSum(_userInput, context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OutlineButton(
        onPressed: () => Navigator.pop(context, _resolveResult()),
        child: Consumer<Matematika>(
          builder: (context, data, child) {
            int maxNumber = data.level * 20;

            int initialNumber = data.firstNumber;

            return NumberPicker.integer(
              listViewWidth: 1000.0,
                itemExtent: 100.0,
                highlightSelectedValue: true,
                initialValue: initialNumber,
                minValue: 0,
                maxValue: maxNumber,
                onChanged: (newValue) => setState(() => _userInput = newValue));
          },
        ));
  }
}
