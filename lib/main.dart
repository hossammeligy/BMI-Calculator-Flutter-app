import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';



void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Color(0xFF0f1511) ,
          textTheme: TextTheme(
              body1: TextStyle(color: Color(0xFFFFFFFF))
          )
      ),
      home: InputPage(),
    );
  }
}


