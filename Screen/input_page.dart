import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/Reusable.dart';
import '../Components/contentInsidecolumn.dart';
import '../constant.dart';
import '../Components/RoundedButton.dart';
import 'result.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  int Weight = 60;
  int Age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        title: Center(
          child: Text(
            "BMI Calculator",
          ),
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //first row
            Expanded(
              child: Row(children: <Widget>[
                Expanded(
                  child: NewWidget(
                    gest: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    colour: gender == Gender.male ? kc : kinactiveCardColor,
                    cardChild:
                        Detail(type: FontAwesomeIcons.male, name: 'Male'),
                  ),
                ),
                Expanded(
                  child: NewWidget(
                      gest: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                      colour: gender == Gender.female ? kc : kinactiveCardColor,
                      cardChild: Detail(
                        type: FontAwesomeIcons.female,
                        name: 'FEMALE',
                      )),
                ),
              ]),
            ),
            //second row
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: NewWidget(
                    colour: kc,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kstyling,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: ktext,
                            ),
                            Text(
                              'cm',
                              style: kstyling,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(),
                            overlayColor: Color(0x1FEB1555),
                            inactiveTickMarkColor: Color(0xFF8D8E98),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: kminSliderValue,
                            max: kMaxSliderValue,
                            onChanged: (double newHeight) {
                              setState(() {
                                height = newHeight.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            //third row
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: NewWidget(
                    colour: kc,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kstyling,
                        ),
                        Text(
                          Weight.toString(),
                          style: ktext,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              addSub: () {
                                setState(() {
                                  Weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              addSub: () {
                                setState(() {
                                  Weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: NewWidget(
                    colour: kc,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kstyling,
                        ),
                        Text(
                          Age.toString(),
                          style: ktext,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              addSub: () {
                                setState(() {
                                  if (Age > 0) {
                                    Age--;
                                  } else {
                                    Age = 0;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              addSub: () {
                                setState(() {
                                  if (Age >= 0) {
                                    Age++;
                                  } else {
                                    Age = 0;
                                  }
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
            )),
            TextButton(
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
              ),
              onPressed: () {
                //for going to the next page
                Calculatorbrain calc =
                    Calculatorbrain(height: height, weight: Weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
            )
          ]),
    );
  }
}
