import 'package:arator/pages/buy/buy_product_detail_page.dart';
import 'package:arator/pages/buy/buyer_product_overview.dart';
import 'package:arator/pages/buy/shopping_cart.dart';
import 'package:arator/pages/chat/message_page.dart';
import 'package:arator/pages/profile/add_friend.dart';
import 'package:arator/pages/profile/address_configuration.dart';
import 'package:arator/pages/profile/location_preferences.dart';
import 'package:arator/pages/profile/message_overview.dart';
import 'package:arator/pages/profile/personal_profile_detail.dart';
import 'package:arator/pages/profile/profile_overview.dart';
import 'package:arator/pages/profile/settings_overview.dart';
import 'package:arator/pages/profile/transaction_history.dart';
import 'package:arator/pages/sell/seller_add_product_page.dart';
import 'package:arator/pages/sell/seller_product_detail_page.dart';
import 'package:arator/pages/sell/seller_product_overview.dart';
import 'package:arator/pages/sell/seller_user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/common/bottom_navigation.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String register = '/register';
  static const String login = '/login';
  static const String buy = '/buy';
  static const String sell = '/sell';
  static const String profile = '/profile';
  static const String sellerAddProduct = '/seller_add_product';
  static const String buyProductDetail = '/buy/product_detail';
  static const String sellerUserProfile = '/sell/user_profile';
  static const String userMessage = '/message/user';
  static const String messageOverview = '/profile/message_overview';
  static const String locationPreferences = '/profile/preferences/location';
  static const String addFriend = '/profile/add_friend';
  static const String shoppingCart = '/shopping_cart';
  static const String transactionHistory = '/profile/transaction_history';
  static const String personalProfileDetail = '/profile/edit';
  static const String sellerProductDetail = '/seller_product_detail';
  static const String settingsOverview = '/profile/settings';
  static const String addressConfiguration = "/profile/address";
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem, this.initialRoute});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  final String initialRoute;

  static void push(BuildContext context, String route,
      {dynamic object, bool animateRoute = false}) {
    var routeBuilders = _routeBuilders(context, object: object);

    Route pageRoute;
    if (animateRoute) {
      pageRoute = _animatedRoute(routeBuilders, route);
    } else {
      pageRoute = MaterialPageRoute(
        builder: (context) => routeBuilders[route](context),
      );
    }
    Navigator.push(context, pageRoute);
  }

  static Route _animatedRoute(
      Map<String, WidgetBuilder> routeBuilders, String route) {
    return CupertinoPageRoute(
        builder: (context) => routeBuilders[route](context));
  }

  static Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {dynamic object}) {
    return {
      TabNavigatorRoutes.root: (context) => BuyerProductOverview(),
      TabNavigatorRoutes.buy: (context) => BuyerProductOverview(),
      TabNavigatorRoutes.sell: (context) => SellerProductOverview(),
      TabNavigatorRoutes.profile: (context) => ProfileOverview(),
      TabNavigatorRoutes.sellerAddProduct: (context) => SellerAddProductPage(),
      TabNavigatorRoutes.sellerProductDetail: (context) =>
          SellerProductDetail(product: object),
      TabNavigatorRoutes.buyProductDetail: (context) =>
          BuyProductDetailPage(product: object),
      TabNavigatorRoutes.sellerUserProfile: (context) => SellerUserProfile(),
      TabNavigatorRoutes.userMessage: (context) => MessagePage(),
      TabNavigatorRoutes.messageOverview: (context) => MessageOverviewPage(),
      TabNavigatorRoutes.locationPreferences: (context) =>
          LocationPreferencesPage(),
      TabNavigatorRoutes.addFriend: (context) => AddFriendPage(),
      TabNavigatorRoutes.shoppingCart: (context) => ShoppingCartPage(),
      TabNavigatorRoutes.transactionHistory: (context) =>
          TransactionHistoryPage(),
      TabNavigatorRoutes.personalProfileDetail: (context) =>
          PersonalProfileDetailPage(),
      TabNavigatorRoutes.settingsOverview: (context) => SettingsOverview(),
      TabNavigatorRoutes.addressConfiguration: (context) =>
          AddressConfiguration(),
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
