import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/common/bottom_navigation.dart';
import 'data/bloc/product_bloc.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  TabItem _currentTab = TabItem.buy;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.buy: GlobalKey<NavigatorState>(),
    TabItem.sell: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.buy) {
            // select 'main' tab
            _selectTab(TabItem.buy);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.buy, TabNavigatorRoutes.buy),
          _buildOffstageNavigator(TabItem.sell, TabNavigatorRoutes.sell),
          _buildOffstageNavigator(TabItem.profile, TabNavigatorRoutes.profile),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem, String initialRoute) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
        initialRoute: initialRoute,
      ),
    );
  }
}
