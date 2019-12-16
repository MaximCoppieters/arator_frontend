import 'package:arator/business/bloc/authentication_bloc.dart';
import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/data/UserCredentials.dart';
import 'package:arator/style/theme.dart' as Theme;
import 'package:arator/utils/enums/login_field.dart';
import 'package:arator/utils/exceptions/authentication_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  String emailError = "";
  String passwordError = "";

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;

  Color left = Colors.black;
  Color right = Colors.white;

  AuthenticationBloc _authenticationBloc;
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      authenticationBloc: _authenticationBloc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: BlocBuilder<LoginBloc, LoginState>(
                    bloc: _loginBloc,
                    builder: (context, loginState) {
                      BoxDecoration loginFormBoxDecoration;

                      loginFormBoxDecoration = BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: loginState is LoginLoading
                                  ? Colors.green
                                  : Colors.white,
                              width: 3.0));
                      return Container(
                        decoration: loginFormBoxDecoration,
                        padding: EdgeInsets.all(5.0),
                        width: 310.0,
                        height: 200.0,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 20.0,
                                    left: 25.0,
                                    right: 25.0),
                                child: emailField(),
                              ),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 20.0,
                                    left: 25.0,
                                    right: 25.0),
                                child: passwordField(),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                  margin: EdgeInsets.only(top: 170.0),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Theme.Colors.loginGradientStart,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                      BoxShadow(
                        color: Theme.Colors.loginGradientEnd,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                    ],
                    gradient: new LinearGradient(
                        colors: [Colors.green, Colors.green[200]],
                        begin: const FractionalOffset(0.2, 0.2),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: MaterialButton(
                      highlightColor: Colors.green,
                      splashColor: Colors.green[800],
                      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 42.0),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: "WorkSansBold"),
                        ),
                      ),
                      onPressed: () {
                        _loginBloc.add(LoginButtonPressed(
                            userCredentials: UserCredentials(
                                email: loginEmailController.text,
                                password: loginPasswordController.text)));
                      })),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: FlatButton(
                onPressed: () {
                  UserCredentials(
                      email: loginEmailController.text,
                      password: loginPasswordController.text);
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: "WorkSansMedium"),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.white10,
                          Colors.white,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    "Or",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: "WorkSansMedium"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white10,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 40.0),
                child: GestureDetector(
                  onTap: () => {},
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new Icon(
                      FontAwesomeIcons.facebookF,
                      color: Color(0xFF0084ff),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () => {},
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new Icon(
                      FontAwesomeIcons.google,
                      color: Color(0xFF0084ff),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget initialLoginForm() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.white, width: 1.0)),
      padding: EdgeInsets.all(5.0),
      width: 310.0,
      height: 200.0,
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
              child: emailField(),
            ),
            Container(
              width: 250.0,
              height: 1.0,
              color: Colors.grey[400],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
              child: passwordField(),
            ),
          ],
        ),
      ),
    );
  }

  Widget passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: _loginBloc,
        builder: (context, snapshot) {
          return TextField(
            focusNode: myFocusNodePasswordLogin,
            controller: loginPasswordController,
            obscureText: _obscureTextLogin,
            style: TextStyle(
                fontFamily: "WorkSansSemiBold",
                fontSize: 16.0,
                color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                FontAwesomeIcons.lock,
                size: 22.0,
                color: Colors.black,
              ),
              errorText: getFieldErrorText(LoginField.password),
              errorStyle: TextStyle(height: 0.0),
              hintText: "Password",
              hintStyle:
                  TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 17.0),
              suffixIcon: GestureDetector(
                onTap: _toggleLogin,
                child: Icon(
                  _obscureTextLogin
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  size: 15.0,
                  color: Colors.black,
                ),
              ),
            ),
          );
        });
  }

  Widget emailField() {
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: _loginBloc,
        builder: (context, loginState) {
          return TextField(
            focusNode: myFocusNodeEmailLogin,
            controller: loginEmailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                fontFamily: "WorkSansSemiBold",
                fontSize: 16.0,
                color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                FontAwesomeIcons.envelope,
                color: Colors.black,
                size: 22.0,
              ),
              hintText: "Email Address",
              errorText: getFieldErrorText(LoginField.email),
              errorStyle: TextStyle(height: 0.0),
              hintStyle:
                  TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 17.0),
            ),
          );
        });
  }

  String getFieldErrorText(LoginField field) {
    if (_loginBloc.state is LoginFailure) {
      AuthenticationException error = _loginBloc.state.props[0];
      if (error.field == field) {
        return error.message;
      }
    }
    return "";
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }
}
