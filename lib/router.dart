import 'package:flutter/material.dart';
import 'package:matematika/pages/home_page.dart';
import 'package:matematika/pages/answer_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Here we'll handle all the routing
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());
    case 'numberPicker':
      return MaterialPageRoute(builder: (context) => AnswerNumber());

    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
