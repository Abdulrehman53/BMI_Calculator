import 'package:bmi_calculator/InputPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff090B22),
          scaffoldBackgroundColor: Color(0xff090B22),
          textTheme: TextTheme(body1: TextStyle(color: Colors.teal))),
      home: InputPage(),
    );
  }
}
