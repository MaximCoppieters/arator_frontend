import 'package:arator/components/elements/button.dart';
import 'package:arator/components/reusable_card.dart';
import 'package:arator/constants.dart';
import 'package:arator/style/theme.dart';
import 'package:flutter/material.dart';

class BMIResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const BMIResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: AratorTheme.styles.kTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: AratorTheme.primaryColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: AratorTheme.styles.kBMIStyle,
                  ),
                  Text(
                    interpretation,
                    style: AratorTheme.styles.kBodyStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: AppButton(
              child: Text('Re-calculate'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
