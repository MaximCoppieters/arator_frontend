import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  FocusNode focusNode;
  TextEditingController controller;
  IconData decorationIconData;
  bool isPassword;
  String errorText;
  TextInputType keyboardType;
  String hintText;
  TextCapitalization textCapitalization;

  AppTextField(
      {this.focusNode,
      this.controller,
      this.isPassword = false,
      this.errorText,
      this.hintText,
      this.decorationIconData,
      this.textCapitalization = TextCapitalization.none,
      this.keyboardType = TextInputType.text}) {}

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      obscureText: widget.isPassword && isObscure,
      textCapitalization: widget.textCapitalization,
      style: TextStyle(fontSize: 16.0, color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: widget.decorationIconData != null
            ? Icon(
                widget.decorationIconData,
                size: 22.0,
                color: Colors.black,
              )
            : null,
        errorText: widget.errorText,
        errorStyle: TextStyle(height: 0.0),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 17.0),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: _toggleObscurity,
                child: Icon(
                  isObscure ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                  size: 15.0,
                  color: Colors.black,
                ),
              )
            : null,
      ),
    );
  }

  void _toggleObscurity() {
    setState(() {
      isObscure = !isObscure;
    });
  }
}
