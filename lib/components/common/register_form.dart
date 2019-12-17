import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/bloc/register_bloc.dart';
import 'package:arator/components/common/login_form_box_decoration.dart';
import 'package:arator/data/UserCredentials.dart';
import 'package:arator/utils/enums/login_field.dart';
import 'package:arator/utils/exceptions/authentication_exception.dart';
import 'package:flutter/material.dart';
import 'package:arator/style/theme.dart' as Theme;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  RegisterForm(this.scaffoldKey);
  @override
  _RegisterFormState createState() => _RegisterFormState(scaffoldKey);
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  String nameError = "";
  String emailError = "";
  String passwordError = "";
  String confirmPasswordError = "";

  RegisterBloc _registerBloc;

  _RegisterFormState(this._scaffoldKey);

  @override
  void initState() {
    _registerBloc = new RegisterBloc();
    _registerBloc.listen((state) {
      print(state);
      if (state is RegisterFailure) {
        AuthenticationException error = state.props[0];
        if (error.field == null) {
          showInSnackBar(error.message);
        }
      } else if (state is RegisterComplete) {
        showInSnackBar("Account succesfully created");
      }
    });
    super.initState();
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
                child: BlocBuilder<RegisterBloc, RegisterState>(
                    bloc: _registerBloc,
                    builder: (context, registerState) {
                      return Container(
                        decoration: authFormDecoration(
                            hasBorder: registerState is RegisterLoading),
                        width: 300.0,
                        height: 380.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 20.0,
                                    left: 25.0,
                                    right: 25.0),
                                child: formTextField(
                                    focusNode: nameFocusNode,
                                    controller: signupNameController,
                                    hintText: "Name",
                                    loginFieldType: LoginField.name,
                                    icon: FontAwesomeIcons.user,
                                    textCapitalization:
                                        TextCapitalization.words)),
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
                                child: formTextField(
                                    focusNode: emailFocusNode,
                                    controller: signupEmailController,
                                    hintText: "Email",
                                    loginFieldType: LoginField.email,
                                    icon: FontAwesomeIcons.envelope,
                                    textCapitalization:
                                        TextCapitalization.none)),
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
                                child: passwordField(
                                    controller: signupPasswordController,
                                    focusNode: passwordFocusNode,
                                    obscureText: _obscureTextSignup,
                                    loginFieldType: LoginField.password,
                                    hintText: "Password",
                                    onEyeTap: _toggleSignup)),
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
                                child: passwordField(
                                    controller: signupConfirmPasswordController,
                                    focusNode: confirmPasswordFocusNode,
                                    loginFieldType: LoginField.confirmPassword,
                                    obscureText: _obscureTextSignupConfirm,
                                    hintText: "Confirmation",
                                    onEyeTap: _toggleSignupConfirm)),
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 340.0),
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
                    highlightColor: Colors.transparent,
                    splashColor: Theme.Colors.loginGradientEnd,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: () {
                      _registerBloc.add(RegisterButtonPressed(
                        userCredentials: UserCredentials(
                            name: this.signupNameController.text,
                            email: this.signupEmailController.text,
                            password: this.signupPasswordController.text,
                            confirmPassword:
                                this.signupConfirmPasswordController.text),
                      ));
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget passwordField(
      {FocusNode focusNode,
      TextEditingController controller,
      bool obscureText,
      LoginField loginFieldType,
      String hintText,
      Function onEyeTap}) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        bloc: _registerBloc,
        builder: (context, registerState) {
          return TextField(
            focusNode: focusNode,
            controller: controller,
            obscureText: obscureText,
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
              errorText: getFieldErrorText(loginFieldType),
              errorStyle: TextStyle(height: 0.0),
              hintText: hintText,
              hintStyle:
                  TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 17.0),
              suffixIcon: GestureDetector(
                onTap: onEyeTap,
                child: Icon(
                  obscureText
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

  Widget formTextField({
    FocusNode focusNode,
    TextEditingController controller,
    String hintText,
    LoginField loginFieldType,
    IconData icon,
    textCapitalization: TextCapitalization.words,
  }) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: loginFieldType == LoginField.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      style: TextStyle(
          fontFamily: "WorkSansSemiBold", fontSize: 16.0, color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          icon,
          color: Colors.black,
          size: 22.0,
        ),
        hintText: hintText,
        errorText: getFieldErrorText(loginFieldType),
        errorStyle: TextStyle(height: 0.0),
        hintStyle: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 17.0),
      ),
    );
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

  String getFieldErrorText(LoginField field) {
    if (_registerBloc.state is RegisterFailure) {
      AuthenticationException error = _registerBloc.state.props[0];
      if (error.field == field) {
        return error.message;
      }
    }
    return "";
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.orange,
      duration: Duration(seconds: 3),
    ));
  }
}
