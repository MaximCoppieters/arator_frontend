import 'dart:async';
import 'dart:math';

import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/gps_service.dart';
import 'package:arator/components/buy/heart_rate_circle.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/elements/button.dart';
import 'package:arator/components/maps/shopping_route_map.dart';
import 'package:arator/data/model/ShoppingCart.dart';
import 'package:arator/data/repo/shopping_cart_repo.dart';
import 'package:arator/style/theme.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pedometer/pedometer.dart';

class ShoppingTripPage extends StatefulWidget {
  final ShoppingCart _shoppingCart;
  ShoppingTripPage(this._shoppingCart);

  @override
  _ShoppingTripPageState createState() => _ShoppingTripPageState();
}

class _ShoppingTripPageState extends State<ShoppingTripPage> {
  GpsService _gpsService = GpsService();
  final num mapBoxHeight = 200.0;

  String _distanceInKm = "0";
  String _caloriesBurned = "0";

  String _stepCountValue = "0";
  StreamSubscription<int> _subscription;

  RouteTripBloc _routeTripBloc;
  BluetoothDeviceBloc _bluetoothDeviceBloc;
  BmiBloc _bmiBloc;

  double _numberx;
  double _convert;
  double _distanceInKilometers;

  ShoppingCartRepository _shoppingCartRepository = ShoppingCartRepository();

  @override
  void initState() {
    _bmiBloc = BlocProvider.of<BmiBloc>(context);
    _routeTripBloc = BlocProvider.of<RouteTripBloc>(context);
    super.initState();
    setUpPedometer();
  }

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
      _numberx = y;
    });

    var long3 = (_numberx);
    long3 = num.parse(y.toStringAsFixed(2));
    var long4 = (long3 / 10000);

    int decimals = 1;
    int fac = pow(10, decimals);
    double d = long4;
    d = (d * fac).round() / fac;
    print("d: $d");

    getDistanceRun(_numberx);

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
      _distanceInKm = "$distance";
    });
    setState(() {
      _distanceInKilometers = num.parse(distancekmx.toStringAsFixed(2));
    });
  }

  void getBurnedRun() {
    setState(() {
      var calories = _distanceInKilometers;
      if (_distanceInKilometers == null) {
        calories = 0;
      }
      _caloriesBurned = "$calories";
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

  Set<Marker> getRoutePointsBetweenDestinations(
      Position source, List<Position> destinations) {
    Set<Marker> markers = Set();
    for (var i = 0; i < destinations.length; i++) {
      Position destination = destinations[i];
      Marker marker = Marker(
          position: LatLng(destination.latitude, destination.longitude),
          markerId: MarkerId(i.toString()));
      markers.add(marker);
    }
    return markers;
  }

  @override
  void dispose() {
    super.dispose();
    _routeTripBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    getBurnedRun();
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        FutureBuilder(
            future: _gpsService.getUserPosition(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Position initialPosition = snapshot.data;
                Set<Marker> markers = getRoutePointsBetweenDestinations(
                    initialPosition,
                    _shoppingCartRepository.getRouteTripPoints());
                return Column(
                  children: <Widget>[
                    PageBodyContainer(
                        child: Text("Choose on map",
                            style: AratorTheme.styles.headlineStyle)),
                    Container(
                        height: 200.0,
                        child: ShoppingRouteMap(
                          startingPosition: initialPosition,
                          shoppingStops: markers,
                        )),
                  ],
                );
              } else if (snapshot.hasError) {
                return Container(
                    height: mapBoxHeight,
                    child: Text("Couldn't get locations"));
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
                  height: 5.0,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(250.0),
                        border: Border.all(
                            width: 5.0,
                            color: Colors.red,
                            style: BorderStyle.solid)),
                    child: HeartRateCircle(
                      width: 120.0,
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Step Count",
                            style: Theme.of(context).textTheme.title),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(_stepCountValue,
                            style: TextStyle(
                                color: AratorTheme.primaryColor,
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Calories burned (kcal)",
                            style: Theme.of(context).textTheme.title),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(_caloriesBurned,
                            style: TextStyle(
                                color: AratorTheme.primaryColor,
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Distance Walked (km)",
                            style: Theme.of(context).textTheme.title),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(_distanceInKm,
                            style: TextStyle(
                                color: AratorTheme.primaryColor,
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<BmiBloc, BmiState>(
                  bloc: _bmiBloc,
                  builder: (BuildContext context, BmiState state) {
                    if (state is Calculated) {
                      var bmi = state.props[0];
                      return Text("Based on your BMI of $bmi");
                    } else {
                      return Column(
                        children: <Widget>[
                          Text("To get more accurate results"),
                          SizedBox(
                            height: 8.0,
                          ),
                          AppButton(
                            child: Text("Calculate BMI"),
                            onPressed: () {
                              TabNavigator.push(
                                  context, TabNavigatorRoutes.bmiCalculator);
                            },
                          )
                        ],
                      );
                    }
                  },
                )
              ],
            )
          ],
        ))
      ],
    )));
  }
}
