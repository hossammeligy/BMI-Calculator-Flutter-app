import 'dart:math';
import 'results_page.dart';
import 'bottom_button.dart';

import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'calculator_brain.dart';


enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Color maleCardColor = kActiveCardColor;
  Color femaleCardColor = kActiveCardColor;
  Gender selectedGender;
  int height = 140;
  int weight = 60;
  int age =20;

  void updateColor(Gender selectedGender){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male? kInactiveCardColor : kActiveCardColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE"
                    ),
                  ),
              ),
              Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female? kInactiveCardColor : kActiveCardColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE"
                    ),
                  ),
              ),
            ],
          )),

           Expanded(
                 child: ReusableCard(
                   colour: kActiveCardColor,
                   cardChild: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text(
                         'HEIGHT',
                         style: kLabelTextStyle,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.baseline,
                         textBaseline: TextBaseline.alphabetic,
                         children: <Widget>[
                           Text(
                             height.toString(),
                             style: kNumberLabelStyle
                           ),
                           Text(
                             'cm',
                             style: kLabelTextStyle,
                           )
                         ],
                       ),
                       SliderTheme(
                         data: SliderTheme.of(context).copyWith(
                           activeTrackColor: kPrimaryColor,
                           inactiveTrackColor: Color(0xFF525653) ,
                           thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                           thumbColor: Color(0xFF0f1511),
                           overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                           overlayColor: Color(0x9A525653)
                         ),
                         child: Slider(
                           value: height.toDouble(),
                           min: 50,
                           max: 250,
                           onChanged: (double newValue){
                             setState(() {
                               height = newValue.round();
                             });
                           },
                         ),
                       ),
                     ],
                   ),
                 ),
               ),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                      cardChild : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                              weight.toString(),
                            style: kNumberLabelStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),

                            ],
                          ),
                        ],
                      )
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){setState(() {
                            age--;
                          });}),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){setState(() {
                            age++;
                          });})
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(buttonTitle : 'CALCULATE', onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              description: calc.getResultDescription(),
            )));
          }),
        ],
      ) ,
    );
  }
}


class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon,@required this.onPressed});

  final Function onPressed;
  final IconData icon;
  
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Colors.black54,
    );
  }
}


