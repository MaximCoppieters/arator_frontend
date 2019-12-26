import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/bloc/user_bloc.dart';
import 'package:arator/business/bloc/user_settings_bloc.dart';
import 'package:arator/business/bloc/user_settings_state.dart';
import 'package:arator/business/bloc/user_state.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/elements/navigation_list_tile.dart';
import 'package:arator/data/model/User.dart';
import 'package:arator/style/theme.dart';
import 'package:arator/tab_navigator.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPreferencesPage extends StatefulWidget {
  @override
  _LocationPreferencesPageState createState() =>
      _LocationPreferencesPageState();
}

class _LocationPreferencesPageState extends State<LocationPreferencesPage> {
  double _productDistanceThreshold = 5.0;
  final _productDistanceMin = 0.0;
  final _productDistanceMax = 50.0;

  UserBloc _userBloc;
  UserSettingsBloc _userSettingsBloc;
  User _user;

  @override
  void initState() {
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userSettingsBloc = BlocProvider.of<UserSettingsBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Preferences"),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<UserBloc, UserState>(
            bloc: _userBloc,
            builder: (context, userState) {
              if (userState is UserLoaded) {
                this._user = userState.props[0];

                return BlocBuilder<UserSettingsBloc, UserSettingsState>(
                    bloc: _userSettingsBloc,
                    builder: (context, userSettingsState) {
                      return Column(
                        children: <Widget>[
                          Card(
                              child: Column(
                            children: <Widget>[
                              PageBodyContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Buying",
                                        style: AratorTheme
                                            .styles.settingsHeadlineStyle),
                                    Text(
                                      "Find products in range",
                                      style: AratorTheme.styles.titleStyle,
                                    ),
                                    Container(
                                      child: Slider(
                                          value: _productDistanceThreshold,
                                          label: _productDistanceThreshold
                                              .toString(),
                                          onChanged: (value) => {
                                                setState(() => {
                                                      _productDistanceThreshold =
                                                          value
                                                              .round()
                                                              .toDouble()
                                                    })
                                              },
                                          onChangeEnd: (value) => {
                                                _user.userSettings
                                                        .maxProductDistance =
                                                    _productDistanceThreshold,
                                                _userSettingsBloc.add(
                                                    ChangeUserSettings(
                                                        _user.userSettings))
                                              },
                                          divisions: 50,
                                          min: _productDistanceMin,
                                          max: _productDistanceMax),
                                    ),
                                    Text(
                                        "Max seller distance: ${_productDistanceThreshold.toString()} km"),
                                  ],
                                ),
                              ),
                              Divider(),
                              PageBodyContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Find products from",
                                        style: AratorTheme.styles.titleStyle),
                                    RadioListTile(
                                      title: Text("GPS Location"),
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      value: false,
                                      groupValue:
                                          _user.userSettings.useGpsLocation,
                                      onChanged: changeGpsLocation,
                                    ),
                                    RadioListTile(
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      value: true,
                                      groupValue:
                                          _user.userSettings.useGpsLocation,
                                      onChanged: changeGpsLocation,
                                      title: Text('My Address'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                          Card(
                              child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                PageBodyContainer(
                                    child: Text("Selling",
                                        style: AratorTheme
                                            .styles.settingsHeadlineStyle)),
                                AppNavigationListTile(
                                  route:
                                      TabNavigatorRoutes.addressConfiguration,
                                  titleText: "Address",
                                  withTopBorder: true,
                                  trailingText: "",
                                )
                              ],
                            ),
                          )),
                          showUserSettingsProgress(userSettingsState),
                        ],
                      );
                    });
              } else if (userState is UserLoadFailed) {
                return Text("User could not be loaded");
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  changeGpsLocation(value) {
    _user.userSettings.useGpsLocation = value;
    _userSettingsBloc.add(ChangeUserSettings(_user.userSettings));
  }

  Widget showUserSettingsProgress(UserSettingsState userSettingsState) {
    if (userSettingsState is UserSettingsChanging) {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    } else if (userSettingsState is UserSettingsChangeFailed) {
      FormException error = userSettingsState.props[0];
      return Expanded(
          child: Center(
        child: Text(error.message),
      ));
    } else {
      return Container();
    }
  }
}
