import 'package:arator/style/theme.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';

class AppNavigationListTile extends StatelessWidget {
  final String route;
  final String trailingText;
  final String titleText;
  final Icon leadingIcon;
  final bool withTopBorder;
  final bool withBottomBorder;

  AppNavigationListTile(
      {@required this.route,
      @required this.titleText,
      this.trailingText = "",
      this.leadingIcon,
      this.withTopBorder = false,
      this.withBottomBorder = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: withTopBorder || withBottomBorder
          ? BoxDecoration(
              border: Border(
                  top: withTopBorder ? _borderSide() : BorderSide.none,
                  bottom: withBottomBorder ? _borderSide() : BorderSide.none))
          : null,
      child: ListTile(
        onTap: () => {TabNavigator.push(context, route)},
        contentPadding: EdgeInsets.only(left: 30.0, right: 10.0),
        title: Text(titleText, style: AratorTheme.styles.titleStyle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(trailingText),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  BorderSide _borderSide() {
    return BorderSide(color: Colors.black12);
  }
}
