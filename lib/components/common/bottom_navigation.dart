import 'package:arator/style/theme.dart';
import 'package:flutter/material.dart';

enum TabItem { buy, sell, profile }

Map<TabItem, String> tabName = {
  TabItem.buy: 'buy',
  TabItem.sell: 'sell',
  TabItem.profile: 'profile',
};

Map<TabItem, Color> activeTabColor = {
  TabItem.buy: AratorTheme.primaryColor,
  TabItem.sell: AratorTheme.secondaryColor,
  TabItem.profile: Colors.black87,
};

Map<TabItem, IconData> tabIcons = {
  TabItem.buy: Icons.shopping_basket,
  TabItem.sell: Icons.store,
  TabItem.profile: Icons.account_circle,
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.buy),
        _buildItem(tabItem: TabItem.sell),
        _buildItem(tabItem: TabItem.profile),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcons[tabItem],
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? activeTabColor[item] : Colors.grey;
  }
}
