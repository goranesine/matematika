import 'package:flutter/material.dart';
import 'package:matematika/pages/home_page.dart';
import 'package:matematika/pages/answer_page.dart';
import 'package:matematika/reusableWidget/animations/number_picker.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Here we'll handle all the routing
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());
    case 'numberPicker':
      return MaterialPageRoute(builder: (context) => AnswerNumber());
      case 'myNumberPicker':
      return MaterialPageRoute(builder: (context) => ListNumberDisplay());

    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
