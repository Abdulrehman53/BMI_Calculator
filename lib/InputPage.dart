import 'package:bmi_calculator/ResultPage.dart';
import 'package:bmi_calculator/ResusableWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'BrainCalculator.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableWidget(
                        color: selectedGender == Gender.male
                            ? containerColor
                            : inactiveCardColor,
                        childCard: GenderBox(
                          color: Color(0xff8E8E9B),
                          iconData: FontAwesomeIcons.mars,
                          genderType: 'Male',
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableWidget(
                      color: selectedGender == Gender.female
                          ? containerColor
                          : inactiveCardColor,
                      childCard: GenderBox(
                        color: Color(0xff8E8E9B),
                        iconData: FontAwesomeIcons.venus,
                        genderType: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableWidget(
              color: containerColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLableStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kLableStyleLarge,
                      ),
                      Text(
                        'cm',
                        style: kLableStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8D8E98),
                      thumbColor: Color(0xffEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableWidget(
                    color: containerColor,
                    childCard: CustomWeightWidget(
                      val: weight,
                      attr: 'Weight',
                      onPressedMinus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      onPressedPlus: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    color: containerColor,
                    childCard: CustomWeightWidget(
                      val: age,
                      attr: 'Age',
                      onPressedMinus: () {
                        setState(() {
                          age--;
                        });
                      },
                      onPressedPlus: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BrainCalculator branCalc =
                  BrainCalculator(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmiResult: branCalc.calculateBMI(),
                  bmiText: branCalc.getResult(),
                  interpretation: branCalc.getInterpretation(),
                );
              }));
            },
            child: buildBottomButton(),
          )
        ],
      ),
    );
  }

  Container buildBottomButton() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Center(
        child: Text(
          'CALCULATE',
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 60.0,
      color: buttonColor,
    );
  }
}

class GenderBox extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final String genderType;
  GenderBox({this.color, this.iconData, this.genderType});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          genderType,
          style: kLableStyle,
        ),
      ],
    );
  }
}

class MyRoundedButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  MyRoundedButton({@required this.iconData, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4C4F5E),
      child: Icon(iconData),
      onPressed: onPressed,
    );
  }
}

class CustomWeightWidget extends StatelessWidget {
  int val;
  String attr;
  Function onPressedMinus;
  Function onPressedPlus;
  CustomWeightWidget(
      {this.val, this.attr, this.onPressedMinus, this.onPressedPlus});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          attr,
          style: kLableStyle,
        ),
        Text(
          val.toString(),
          style: kLableStyleLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyRoundedButton(
              iconData: FontAwesomeIcons.minus,
              onPressed: onPressedMinus,
            ),
            SizedBox(
              width: 10.0,
            ),
            MyRoundedButton(
              iconData: FontAwesomeIcons.plus,
              onPressed: onPressedPlus,
            ),
          ],
        )
      ],
    );
  }
}
