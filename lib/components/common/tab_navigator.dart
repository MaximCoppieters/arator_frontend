import 'package:arator/pages/buy/buy_product_detail_page.dart';
import 'package:arator/pages/buy/buyer_tab.dart';
import 'package:arator/pages/profile/profile_tab.dart';
import 'package:arator/pages/sell/seller_add_product_page.dart';
import 'package:arator/pages/sell/seller_tab.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String buy = '/buy';
  static const String sell = '/sell';
  static const String profile = '/profile';
  static const String sellerAddProduct = '/seller_add_product';
  static const String buyProductDetail = '/buy/product_detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem, this.initialRoute});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  String initialRoute;

  static void push(BuildContext context, String route) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[route](context),
      ),
    );
  }

  static Map<String, WidgetBuilder> _routeBuilders(
    BuildContext context,
  ) {
    return {
      TabNavigatorRoutes.root: (context) => BuyerTab(),
      TabNavigatorRoutes.buy: (context) => BuyerTab(),
      TabNavigatorRoutes.sell: (context) => SellerTab(),
      TabNavigatorRoutes.profile: (context) => ProfileTab(),
      TabNavigatorRoutes.sellerAddProduct: (context) => SellerAddProductPage(),
      TabNavigatorRoutes.buyProductDetail: (context) => BuyProductDetailPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
