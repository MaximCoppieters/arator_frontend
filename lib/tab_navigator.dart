import 'package:arator/home.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';
import 'seller_tab.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String sell = '/sell';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.sell](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(
    BuildContext context,
  ) {
    return {
      TabNavigatorRoutes.root: (context) => HomePage(
            color: activeTabColor[tabItem],
            title: tabName[tabItem],
          ),
      TabNavigatorRoutes.sell: (context) =>
          SellerTab(color: activeTabColor[tabItem], title: tabName[tabItem]),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
