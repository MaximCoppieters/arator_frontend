import 'package:arator/business/bloc/authentication_bloc.dart';
import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/components/common/login_form_box_decoration.dart';
import 'package:arator/components/elements/button.dart';
import 'package:arator/components/elements/text_field.dart';
import 'package:arator/data/model/UserCredentials.dart';
import 'package:arator/style/theme.dart';
import 'package:arator/utils/enums/input_name.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../UI.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  LoginForm(this.scaffoldKey);
  @override
  _LoginFormState createState() => _LoginFormState(scaffoldKey);
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  Color left = Colors.black;
  Color right = Colors.white;

  AuthenticationBloc _authenticationBloc;
  LoginBloc _loginBloc;

  _LoginFormState(this._scaffoldKey);

  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      authenticationBloc: _authenticationBloc,
    );
    _loginBloc.listen((state) {
      if (state is LoginFailure) {
        FormException error = state.props[0];
        if (error.field == null) {
          UI.showInSnackBar(context, _scaffoldKey, error.message);
        }
      }
    });
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
                      return Container(
                        decoration: authFormDecoration(
                            hasBorder: loginState is LoginLoading),
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
                                child: AppTextField(
                                  hintText: "Email Address",
                                  focusNode: emailFocusNode,
                                  controller: loginEmailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decorationIconData: FontAwesomeIcons.envelope,
                                  errorText: getFieldErrorText(InputName.email),
                                ),
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
                                  child: AppTextField(
                                      focusNode: passwordFocusNode,
                                      controller: loginPasswordController,
                                      isPassword: true,
                                      hintText: "Password",
                                      decorationIconData: FontAwesomeIcons.lock,
                                      errorText: getFieldErrorText(
                                          InputName.password))),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              AppButton(
                  margin: EdgeInsets.only(top: 170.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      "Login",
                      style: AratorTheme.authButtonTextStyle,
                    ),
                  ),
                  onPressed: () => {
                        _loginBloc.add(LoginButtonPressed(
                            userCredentials: UserCredentials(
                                email: loginEmailController.text,
                                password: loginPasswordController.text)))
                      }),
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
                    fontSize: 16.0,
                  ),
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
                          Colors.black12,
                          Colors.black,
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
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.black12,
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

  String getFieldErrorText(InputName field) {
    if (_loginBloc.state is LoginFailure) {
      FormException error = _loginBloc.state.props[0];
      if (error.field == field) {
        return error.message;
      }
    }
    return "";
  }
}
