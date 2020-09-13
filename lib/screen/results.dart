import 'package:flutter/material.dart';
import '../constants.dart';
import '../component/reusable_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.textResult,
      @required this.descriptionResult});

  final String bmiResult;
  final String textResult;
  final String descriptionResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI calculator')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      textResult,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      descriptionResult,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'RE-CALCULATE',
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
            ),
          ],
        ),
      ),
    );
  }
}
