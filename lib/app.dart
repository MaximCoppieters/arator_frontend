import 'package:arator/business/bloc/authentication_event.dart';
import 'package:arator/pages/common/login_page.dart';
import 'package:arator/tabbed_app_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business/bloc/authentication_bloc.dart';
import 'business/bloc/authentication_state.dart';
import 'business/bloc/user_bloc.dart';
import 'business/bloc/user_event.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

abstract class AppInfo {
  static final baseUrl = "http://672d6c74.ngrok.io";
  static final apiBaseUrl = baseUrl + "/api";
}

class AppState extends State<App> {
  AuthenticationBloc _authenticationBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
    _authenticationBloc.add(AppStarted());
    _authenticationBloc.listen((authenticationState) => {
          if (authenticationState is AuthenticationAuthenticated)
            {_userBloc.add(LoadUser())}
        });
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
