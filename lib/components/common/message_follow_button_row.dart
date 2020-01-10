import 'package:arator/components/elements/button.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';

class MessageFollowButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: AppButton(
            onPressed: () =>
                {TabNavigator.push(context, TabNavigatorRoutes.userMessage)},
            child: Text("Message"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
        ),
        Expanded(
          child: AppButton(
            onPressed: () => {},
            child: Text("Follow"),
          ),
        )
      ],
    );
  }
}
