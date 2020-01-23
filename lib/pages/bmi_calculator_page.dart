import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/components/elements/button.dart';
import 'package:arator/components/icon_content.dart';
import 'package:arator/components/reusable_card.dart';
import 'package:arator/components/round_icon_button.dart';
import 'package:arator/pages/bmi_results_page.dart';
import 'package:arator/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_BMI.dart';

enum Gender { male, female }

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  Gender selectedGender;
  int height = 180, weight = 70, age = 20;

  BmiBloc _bmiBloc;

  @override
  void initState() {
    _bmiBloc = BlocProvider.of<BmiBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: (selectedGender == Gender.male)
                        ? AratorTheme.primaryColor
                        : AratorTheme.primaryLightVariantColor,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: (selectedGender == Gender.female)
                        ? AratorTheme.primaryColor
                        : AratorTheme.primaryLightVariantColor,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: AratorTheme.primaryLightVariantColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: AratorTheme.styles.bmiLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: AratorTheme.styles.kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: AratorTheme.styles.bmiLabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8d8e98),
                        thumbColor: AratorTheme.secondaryColor,
                        overlayColor: Color(0x29eb1555)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (newValue) {
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
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: AratorTheme.primaryLightVariantColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: AratorTheme.styles.bmiLabelStyle,
                        ),
                        Text(
                          '$weight',
                          style: AratorTheme.styles.kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
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
                    color: AratorTheme.primaryLightVariantColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: AratorTheme.styles.bmiLabelStyle,
                        ),
                        Text(
                          '$age',
                          style: AratorTheme.styles.kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
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
          FractionallySizedBox(
            widthFactor: 0.9,
            child: AppButton(
              child: Text("Calculate my BMI"),
              onPressed: () {
                _bmiBloc.add(Calculate(height, weight));
                CalculatorBMI calc =
                    CalculatorBMI(height: height, weight: weight);
                calc.getBMI();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => BMIResultsPage(
                            bmiResult: calc.getBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
