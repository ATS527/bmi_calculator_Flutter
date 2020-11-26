import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_selector_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'calculator_Brain.dart';
//import 'dart:math';

int height = 180;
int weight = 40;
int age = 18;
Gender selectedGender;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardContent: GenderSelectorContent(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                      iconSize: 80,
                      fontSize: kfontSize,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardContent: GenderSelectorContent(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                      iconSize: 80,
                      fontSize: kfontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kcardColor,
              cardContent: Column(
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "HEIGHT",
                    style: klabelText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "cm",
                        style: klabelText,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: kbottomContainerColor,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0)),
                    child: Slider(
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      value: height.toDouble(),
                      min: 120.0,
                      max: 240.0,
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
                  child: ReusableCard(
                    colour: kcardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: klabelText,
                        ),
                        Text(
                          weight.toString(),
                          style: knumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              size: 30,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              onLongPressed: () {
                                setState(() {
                                  weight += 10;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              size: 30,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              onLongPressed: () {
                                setState(() {
                                  weight -= 10;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kcardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: klabelText,
                        ),
                        Text(
                          age.toString(),
                          style: knumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              size: 30,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              onLongPressed: () {
                                setState(() {
                                  age += 10;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              size: 30,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              onLongPressed: () {
                                setState(() {
                                  age -= 10;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  new CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiValue: calc.bmi(),
                    bmiAdvice: calc.bmiAdvice(),
                    bmiCondition: calc.bmiCondition(),
                  ),
                ),
              );
            },
            child: Container(
//              padding: EdgeInsets.only(bottom: 20),
              margin: EdgeInsets.only(top: 15.0),
              width: double.infinity,
              child: Center(
                child: Text(
                  "CALCULATE YOUR BMI",
                  style: kbottomContainerText,
                ),
              ),
              height: 85.0,
              color: kbottomContainerColor,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.icon, this.size, this.onPressed, this.onLongPressed});
  final IconData icon;
  final double size;
  Function onPressed;
  Function onLongPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      onLongPress: onLongPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kroundButtonColor,
      child: Icon(
        icon,
        size: size,
      ),
    );
  }
}
