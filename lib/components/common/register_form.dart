import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/bloc/register_bloc.dart';
import 'package:arator/components/UI.dart';
import 'package:arator/components/common/login_form_box_decoration.dart';
import 'package:arator/components/elements/button.dart';
import 'package:arator/components/elements/text_field.dart';
import 'package:arator/data/model/UserCredentials.dart';
import 'package:arator/utils/enums/input_name.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:flutter/material.dart';
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

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  RegisterBloc _registerBloc;

  _RegisterFormState(this._scaffoldKey);

  @override
  void initState() {
    _registerBloc = new RegisterBloc();
    _registerBloc.listen((state) {
      if (state is RegisterFailure) {
        FormException error = state.props[0];
        if (error.field == null) {
          UI.showInSnackBar(context, _scaffoldKey, error.message);
        }
      } else if (state is RegisterComplete) {
        UI.showInSnackBar(context, _scaffoldKey, "Account succesfully created");
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
                                child: AppTextField(
                                    focusNode: nameFocusNode,
                                    controller: signupNameController,
                                    hintText: "Name",
                                    errorText:
                                        getFieldErrorText(InputName.name),
                                    decorationIconData: FontAwesomeIcons.user,
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
                                child: AppTextField(
                                  hintText: "Email Address",
                                  focusNode: emailFocusNode,
                                  controller: signupEmailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decorationIconData: FontAwesomeIcons.envelope,
                                  errorText: getFieldErrorText(InputName.email),
                                )),
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
                                  controller: signupPasswordController,
                                  isPassword: true,
                                  errorText:
                                      getFieldErrorText(InputName.password),
                                  hintText: "Password",
                                  decorationIconData: FontAwesomeIcons.lock,
                                )),
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
                                  focusNode: confirmPasswordFocusNode,
                                  controller: signupConfirmPasswordController,
                                  isPassword: true,
                                  errorText: getFieldErrorText(
                                      InputName.confirmPassword),
                                  hintText: "Confirmation",
                                  decorationIconData: FontAwesomeIcons.lock,
                                )),
                          ],
                        ),
                      );
                    }),
              ),
              AppButton(
                margin: EdgeInsets.only(top: 360.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
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
                },
              ),
            ],
          ),
        ],
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

  String getFieldErrorText(InputName field) {
    if (_registerBloc.state is RegisterFailure) {
      FormException error = _registerBloc.state.props[0];
      if (error.field == field) {
        return error.message;
      }
    }
    return "";
  }
}
