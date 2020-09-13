import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/reusable_card.dart';
import '../component/gender_content.dart';
import '../constants.dart';
import 'results.dart';
import '../calculator_brain.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //Color maleCardColour = inactiveCardColour;
  //Color femaleCardColour = inactiveCardColour;
  GenderType selectedGender;
  int heightPerson = 180;
  int weightPerson = 60;
  int agePerson = 20;

  /*void updateColour(GenderType name) {
    name == GenderType.male
        ? (maleCardColour == inactiveCardColour
            ? (maleCardColour = activeCardColour &&
                femaleCardColour = inactiveCardColour)
            : maleCardColour = inactiveCardColour)
        : (femaleCardColour = inactiveCardColour
            ? (femaleCardColour == activeCardColour &&
                maleCardColour = inactiveCardColour)
            : femaleCardColour = inactiveCardColour);
    /*if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
      } else
        maleCardColour = inactiveCardColour;
    } else {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      } else
        femaleCardColour = inactiveCardColour;
    }*/
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    /*child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },*/
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      colour: selectedGender == GenderType.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: Gender(FontAwesomeIcons.mars, 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      colour: selectedGender == GenderType.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: Gender(FontAwesomeIcons.venus, 'FEMALE'),
                    ),
                  )
                ],
              )),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
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
                            heightPerson.toString(),
                            style: kNumberStyle,
                          ),
                          Text('cm'),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          thumbColor: Colors.pink,
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: heightPerson.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              heightPerson = newValue.round();
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
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            weightPerson.toString(),
                            style: kNumberStyle,
                          ),
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                func: () {
                                  setState(() {
                                    weightPerson--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                func: () {
                                  setState(() {
                                    weightPerson++;
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
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            agePerson.toString(),
                            style: kNumberStyle,
                          ),
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                func: () {
                                  setState(() {
                                    agePerson--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                func: () {
                                  setState(() {
                                    agePerson++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              GestureDetector(
                onTap: () {
                  CalculatorBrain calc = CalculatorBrain(
                      height: heightPerson, weight: weightPerson);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ResultPage(
                        bmiResult: calc.calculateBMI(),
                        textResult: calc.getResult(),
                        descriptionResult: calc.getDescription(),
                      );
                    }),
                  );
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style: kLargeButtonTextStyle,
                    ),
                  ),
                  color: kBottomContainerColour,
                  margin: EdgeInsets.only(top: 10.0),
                  padding: EdgeInsets.only(bottom: 10.0),
                  width: double.infinity,
                  height: kBottomContainerHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.func});

  final IconData icon;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: func,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
