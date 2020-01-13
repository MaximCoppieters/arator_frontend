import 'dart:math' as Math;

import 'package:arator/components/elements/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputWithIncrementDecrement extends StatefulWidget {
  @override
  _NumberInputWithIncrementDecrementState createState() =>
      _NumberInputWithIncrementDecrementState();
}

class _NumberInputWithIncrementDecrementState
    extends State<NumberInputWithIncrementDecrement> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "0"; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 140.0,
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.blueGrey,
            width: 2.0,
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: AppButton(
                child: Text(
                  "-",
                ),
                onPressed: () {
                  var newValue = Math.max(0, num.parse(_controller.text) - 1);
                  _controller.text = newValue.toString();
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: false,
                  signed: true,
                ),
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: AppButton(
                child: Text("+"),
                onPressed: () => {
                  _controller.text =
                      (num.parse(_controller.text) + 1).toString()
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
