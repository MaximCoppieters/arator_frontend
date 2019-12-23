import 'package:arator/style/theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final EdgeInsets margin;

  AppButton({@required this.onPressed, this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AratorTheme.loginGradientStart,
              offset: Offset(1.0, 6.0),
              blurRadius: 20.0,
            ),
            BoxShadow(
              color: AratorTheme.loginGradientEnd,
              offset: Offset(1.0, 6.0),
              blurRadius: 20.0,
            ),
          ],
          gradient: new LinearGradient(
              colors: [Colors.green, Colors.green[200]],
              begin: const FractionalOffset(0.2, 0.2),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: MaterialButton(
            textColor: Theme.of(context).colorScheme.onPrimary,
            highlightColor: Theme.of(context).colorScheme.primary,
            splashColor: Theme.of(context).colorScheme.primaryVariant,
            child: child,
            onPressed: onPressed));
  }
}
