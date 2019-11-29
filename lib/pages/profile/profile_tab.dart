import 'dart:io';

import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/common/profile_picture.dart';
import 'package:arator/data/profile_navigation_option.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  List<Widget> navigationOptions() {
    return [
      GestureDetector(
        onTap: _routeToPage(TabNavigatorRoutes.changeProfile),
        child: ListTile(
          leading: ProfilePicture(
            "assets/images/pedro.jpg",
            50.0,
          ),
          title: Text("Pedro Fernandez"),
          subtitle: Text("Edit"),
        ),
      ),
      ProfileNavigationOption("Distance Settings", Icons.my_location,
          _routeToPage(TabNavigatorRoutes.settingsOverview)),
      ProfileNavigationOption("Messages", Icons.message,
          _routeToPage(TabNavigatorRoutes.messageOverview)),
      ProfileNavigationOption("Settings", Icons.settings,
          _routeToPage(TabNavigatorRoutes.settingsOverview)),
      ProfileNavigationOption("Shopping Cart", Icons.shopping_basket,
          _routeToPage(TabNavigatorRoutes.shoppingCart)),
      ProfileNavigationOption("Transaction History", Icons.play_arrow,
          _routeToPage(TabNavigatorRoutes.transactionHistory)),
      ProfileNavigationOption("Invite A Friend", Icons.person_add,
          _routeToPage(TabNavigatorRoutes.addFriend)),
      ProfileNavigationOption("Log Out", Icons.exit_to_app, () => exit(0)),
    ];
  }

  Function _routeToPage(String route) {
    return () => {TabNavigator.push(context, route)};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: PageBodyContainer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(children: navigationOptions()),
            ),
          ],
        ),
      ),
    );
  }
}
