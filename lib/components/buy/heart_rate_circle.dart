import 'package:flutter/material.dart';

class HeartRateCircle extends StatefulWidget {
  final num width;

  HeartRateCircle({this.width});
  @override
  _HeartRateCircleState createState() => _HeartRateCircleState();
}

class _HeartRateCircleState extends State<HeartRateCircle>
    with TickerProviderStateMixin {
  AnimationController motionController;

  double size = 20;

  void initState() {
    super.initState();

    motionController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.5,
    );
    motionController.forward();
    motionController.addListener(() {
      setState(() {
        size = motionController.value * 50;
      });
    });

    motionController.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          motionController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          motionController.forward();
        }
      });
    });
  }

  @override
  void dispose() {
    motionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.width,
      child: Stack(
        children: <Widget>[
          Center(
              child: Container(
            alignment: Alignment.center,
            width: widget.width / 2,
            child: Image.asset(
              "assets/images/heart_icon.png",
              width: size,
              fit: BoxFit.contain,
            ),
          )),
          Positioned(
            bottom: 0.0,
            width: widget.width,
            child: Text(
              "90",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
