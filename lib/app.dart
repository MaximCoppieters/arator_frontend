import 'package:arator/business/bloc/authentication_event.dart';
import 'package:arator/pages/common/login_page.dart';
import 'package:arator/tabbed_app_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business/bloc/authentication_bloc.dart';
import 'business/bloc/authentication_state.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

abstract class AppInfo {
  static final baseUrl = "http://86f6919e.ngrok.io";
  static final apiBaseUrl = baseUrl + "/api";
}

class AppState extends State<App> {
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _authenticationBloc.add(AppStarted());
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
