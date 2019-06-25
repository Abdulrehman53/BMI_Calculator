import 'package:bmi_calculator/ResusableWidget.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiText;
  final String interpretation;
  ResultPage(
      {@required this.bmiResult,
      @required this.bmiText,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.0, left: 10.0),
              child: Text(
                'Your Result',
                style: kLableStyleResult,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableWidget(
              color: containerColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    bmiText.toUpperCase(),
                    style: kLableStyleResults,
                  ),
                  Text(
                    bmiResult,
                    style: kLableStyleBMI,
                  ),
                  Text(
                    interpretation,
                    style: kLableStyleBody,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
          'RE-CALCULATE',
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
