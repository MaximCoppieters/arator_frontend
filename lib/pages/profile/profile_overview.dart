import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/common/profile_picture.dart';
import 'package:arator/data/model/User.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileOverview extends StatefulWidget {
  @override
  _ProfileOverviewState createState() => _ProfileOverviewState();
}

class _ProfileOverviewState extends State<ProfileOverview> {
  AuthenticationBloc _authenticationBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _userBloc.close();
    _userBloc.close();
    super.dispose();
  }

  List<Widget> navigationOptions() {
    return [
      BlocBuilder<UserBloc, UserState>(
          bloc: _userBloc,
          builder: (context, userState) {
            if (userState is UserLoaded) {
              User user = userState.props[0];
              return Card(
                child: ListTile(
                    onTap:
                        _routeToPage(TabNavigatorRoutes.personalProfileDetail),
                    leading: Hero(
                      tag: "user-profile-detail",
                      child: ProfilePicture(
                        user,
                        50.0,
                      ),
                    ),
                    title: Text(user.name),
                    subtitle: Text("Check my profile")),
              );
            } else if (userState is UserLoadFailed) {
              return Text("User could not be loaded");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      ProfileNavigationOption("Location Preferences", Icons.gps_fixed,
          _routeToPage(TabNavigatorRoutes.locationPreferences)),
      ProfileNavigationOption("My BMI", Icons.favorite,
          _routeToPage(TabNavigatorRoutes.bmiCalculator)),
      ProfileNavigationOption("My Connected Devices", Icons.bluetooth_connected,
          _routeToPage(TabNavigatorRoutes.myDevices)),
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
      ProfileNavigationOption(
          "Log Out",
          Icons.exit_to_app,
          () => {
                _logoutDialog(context),
              })
    ];
  }

  Future<ConfirmAction> _logoutDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: const Text('Yes'),
              onPressed: () {
                _authenticationBloc.add(LoggedOut());
                Navigator.of(context).pop(ConfirmAction.YES);
              },
            ),
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.NO);
              },
            )
          ],
        );
      },
    );
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

class ProfileNavigationOption extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onTap;

  ProfileNavigationOption(this.title, this.iconData, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(iconData, color: Theme.of(context).primaryColor),
        title: Text(title),
      ),
    );
  }
}

enum ConfirmAction { YES, NO }
