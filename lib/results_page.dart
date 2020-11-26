import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final bmiValue;
  final bmiCondition;
  final bmiAdvice;
  ResultsPage(
      {@required this.bmiValue,
      @required this.bmiCondition,
      @required this.bmiAdvice});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(40),
              child: Text(
                "Your Result",
                style: kyourResultText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ReusableCard(
                colour: kcardColor,
                cardContent: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Text(
                        bmiCondition,
                        style: knormalText,
                      ),
                    ),
                    Center(
                      child: Text(
                        bmiValue,
                        style: kresultNumber,
                      ),
                    ),
                    Center(
                      child: Text(
                        bmiAdvice,
                        style: kresultdesc,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
//              padding: EdgeInsets.only(bottom: 20),
                margin: EdgeInsets.only(top: 15.0),
                width: double.infinity,
                child: Center(
                  child: Text(
                    "RECALCULATE YOUR BMI",
                    style: kbottomContainerText,
                  ),
                ),
                height: 85.0,
                color: kbottomContainerColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
