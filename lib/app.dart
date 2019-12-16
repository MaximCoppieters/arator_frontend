import 'package:arator/data/bloc/authentication_bloc.dart';
import 'package:arator/data/bloc/bloc.dart';
import 'package:arator/pages/common/login_page.dart';
import 'package:arator/tab_navigator.dart';
import 'package:arator/tabbed_app_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/common/bottom_navigation.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: _authenticationBloc,
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationAuthenticated) {
            return TabbedAppView();
          } else {
            return LoginPage();
          }
        });
  }
}
