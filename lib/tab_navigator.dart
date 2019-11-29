import 'package:arator/pages/buy/buy_product_detail_page.dart';
import 'package:arator/pages/buy/buyer_product_overview.dart';
import 'package:arator/pages/buy/shopping_cart.dart';
import 'package:arator/pages/chat/message_page.dart';
import 'package:arator/pages/profile/add_friend.dart';
import 'package:arator/pages/profile/change_profile.dart';
import 'package:arator/pages/profile/message_overview.dart';
import 'package:arator/pages/profile/profile_tab.dart';
import 'package:arator/pages/profile/settings_overview.dart';
import 'package:arator/pages/profile/transaction_history.dart';
import 'package:arator/pages/sell/seller_add_product_page.dart';
import 'package:arator/pages/sell/seller_tab.dart';
import 'package:arator/pages/sell/seller_user_profile.dart';
import 'package:flutter/material.dart';

import 'components/common/bottom_navigation.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String buy = '/buy';
  static const String sell = '/sell';
  static const String profile = '/profile';
  static const String sellerAddProduct = '/seller_add_product';
  static const String buyProductDetail = '/buy/product_detail';
  static const String sellerUserProfile = '/sell/user_profile';
  static const String userMessage = '/message/user';
  static const String messageOverview = '/profile/message_overview';
  static const String settingsOverview = '/profile/settings';
  static const String addFriend = '/profile/add_friend';
  static const String shoppingCart = '/shopping_cart';
  static const String transactionHistory = '/profile/transaction_history';
  static const String changeProfile = '/profile/edit';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem, this.initialRoute});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  final String initialRoute;

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
      TabNavigatorRoutes.root: (context) => BuyerProductOverview(),
      TabNavigatorRoutes.buy: (context) => BuyerProductOverview(),
      TabNavigatorRoutes.sell: (context) => SellerTab(),
      TabNavigatorRoutes.profile: (context) => ProfileTab(),
      TabNavigatorRoutes.sellerAddProduct: (context) => SellerAddProductPage(),
      TabNavigatorRoutes.buyProductDetail: (context) => BuyProductDetailPage(),
      TabNavigatorRoutes.sellerUserProfile: (context) => SellerUserProfile(),
      TabNavigatorRoutes.userMessage: (context) => MessagePage(),
      TabNavigatorRoutes.messageOverview: (context) => MessageOverviewPage(),
      TabNavigatorRoutes.settingsOverview: (context) => SettingsOverviewPage(),
      TabNavigatorRoutes.addFriend: (context) => AddFriendPage(),
      TabNavigatorRoutes.shoppingCart: (context) => ShoppingCartPage(),
      TabNavigatorRoutes.transactionHistory: (context) =>
          TransactionHistoryPage(),
      TabNavigatorRoutes.changeProfile: (context) => ChangeProfilePage(),
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
