import 'package:flutter/material.dart';

class ProfileNavigationOption extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onTap;

  ProfileNavigationOption(this.title, this.iconData, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(iconData, color: Theme.of(context).primaryColor),
        title: Text(title),
      ),
    );
  }
}
