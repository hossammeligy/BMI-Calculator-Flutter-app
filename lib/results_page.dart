import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult,@required this.description, @required this.resultText});
  final String bmiResult,description,resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALACULATOUR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          )
          ),
          Expanded(
              flex: 5,
          child: ReusableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  resultText,
                  style: resultStyle,
                ),
                Text(
                  bmiResult,
                  style: BMIresultStyle,
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: resultDescriptionStyle,
                )
              ],
            ),
          ),
          ),
          BottomButton(buttonTitle: 'BACK', onTap: (){
            Navigator.pop(context);
          },
          )
        ],
      ),
    );
    return Container();
  }
}
