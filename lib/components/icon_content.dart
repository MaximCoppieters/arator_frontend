import 'package:arator/constants.dart';
import 'package:arator/style/theme.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  const IconContent({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: AratorTheme.styles.bmiLabelStyle)
      ],
    );
  }
}
