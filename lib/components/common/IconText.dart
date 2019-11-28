import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final String text;
  final IconData iconData;
  IconText(this.iconData, this.text);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          size: 20.0,
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        Text(text)
      ],
    );
  }
}
