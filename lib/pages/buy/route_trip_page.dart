import 'dart:async';
import 'dart:math';

import 'package:arator/business/gps_service.dart';
import 'package:arator/components/buy/heart_rate_circle.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/maps/shopping_route_map.dart';
import 'package:arator/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pedometer/pedometer.dart';

class ShoppingTripPage extends StatefulWidget {
  @override
  _ShoppingTripPageState createState() => _ShoppingTripPageState();
}

class _ShoppingTripPageState extends State<ShoppingTripPage> {
  GpsService _gpsService = GpsService();
  final num mapBoxHeight = 200.0;

  String muestrePasos = "";
  String _km = "0";
  String _calories = "0";

  String _stepCountValue = "0";
  StreamSubscription<int> _subscription;

  double _numerox; //numero pasos
  double _convert;
  double _kmx;
  double burnedx;
  double _porciento;

  void setUpPedometer() {
    Pedometer pedometer = new Pedometer();
    _subscription = pedometer.pedometerStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void _onData(int stepCountValue) async {
    print(stepCountValue);
    setState(() {
      _stepCountValue = "$stepCountValue";
    });

    var dist = stepCountValue;
    double y = (dist + .0);

    setState(() {
      _numerox = y;
    });

    var long3 = (_numerox);
    long3 = num.parse(y.toStringAsFixed(2));
    var long4 = (long3 / 10000);

    int decimals = 1;
    int fac = pow(10, decimals);
    double d = long4;
    d = (d * fac).round() / fac;
    print("d: $d");

    getDistanceRun(_numerox);

    setState(() {
      _convert = d;
      print(_convert);
    });
  }

  void getDistanceRun(double _numerox) {
    var distance = ((_numerox * 78) / 100000);
    distance = num.parse(distance.toStringAsFixed(2));
    var distancekmx = distance * 34;
    distancekmx = num.parse(distancekmx.toStringAsFixed(2));
    setState(() {
      _km = "$distance";
    });
    setState(() {
      _kmx = num.parse(distancekmx.toStringAsFixed(2));
    });
  }

  void getBurnedRun() {
    setState(() {
      var calories = _kmx;
      _calories = "$calories";
    });
  }

  void reset() {
    setState(() {
      int stepCountValue = 0;
      stepCountValue = 0;
      _stepCountValue = "$stepCountValue";
    });
  }

  void _onDone() {}

  void _onError(error) {
    print("Flutter Pedometer Error: $error");
  }

  @override
  void initState() {
    super.initState();
    setUpPedometer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        FutureBuilder(
            future: _gpsService.getUserPosition(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Position initialPosition = snapshot.data;
                return Column(
                  children: <Widget>[
                    PageBodyContainer(
                        child: Text("Choose on map",
                            style: AratorTheme.styles.headlineStyle)),
                    Container(
                        height: 200.0,
                        child:
                            ShoppingRouteMap(startingPosition: initialPosition))
                  ],
                );
              } else if (snapshot.hasError) {
                return Container(
                    height: mapBoxHeight,
                    child: Text(snapshot.error.toString()));
              } else {
                return Container(
                  height: mapBoxHeight,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            }),
        PageBodyContainer(
            child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("Heart Rate", style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                    padding: EdgeInsets.all(50.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(250.0),
                        border: Border.all(
                            width: 5.0,
                            color: Colors.red,
                            style: BorderStyle.solid)),
                    child: HeartRateCircle(
                      width: 150.0,
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Text("Step Count", style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 15.0,
                ),
                Text(_stepCountValue,
                    style: TextStyle(
                        color: AratorTheme.primaryColor,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold))
              ],
            )
          ],
        ))
      ],
    )));
  }
}
