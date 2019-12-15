import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class Matematika with ChangeNotifier {

  int _firstNumber = 0;
  int _secondNumber = 0;
  int _sum;
  int _level = 1;
  Random _random = Random();
  int _points = 0;

  int get firstNumber => _firstNumber;

  int get secondNumber => _secondNumber;

  int get level => _level;

  int get points => _points;


  void getRandomNumber() {
    _firstNumber = _random.nextInt(_level * 10);
    _secondNumber = _random.nextInt(_level * 10);
    notifyListeners();
  }

  void checkSum(int userInput, context) {
    _sum = _firstNumber + _secondNumber;
    if (userInput != _sum) {
      falseResult();
    } else {
      trueResult();
    }
  }

  void falseResult() {
    num _division = points / 3;
    int _lenght = _division.toString().length;
    if (_lenght == 3) {
      _level = zeroLevels(_level);
      notifyListeners();
      _points = zeroPoints(_points);
      notifyListeners();
    } else {
      _points = zeroPoints(_points);
      notifyListeners();
    }
  }

  int zeroLevels(int currentLevel) {
    currentLevel < 2 ? _level = 1 : _level = _level - 1;

    getRandomNumber();
    notifyListeners();

    return _level;
  }

  int zeroPoints(int currentPoints) {
    currentPoints < 1 ? _points = 0 : _points = _points - 1;
    getRandomNumber();
    notifyListeners();
    return _points;
  }

  void trueResult() {
    _points = _points + 1;
    notifyListeners();
    countAnswers();
    getRandomNumber();
  }

  void countAnswers() {
    num _division = _points / 3;
    int _lenght = _division.toString().length;

    if (_lenght == 3) {
      _level = _level + 1;

      getRandomNumber();
      notifyListeners();
    }
  }
}
