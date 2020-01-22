import 'package:arator/business/gps_service.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/elements/button.dart';
import 'package:arator/components/maps/shopping_route_map.dart';
import 'package:arator/data/model/ShoppingCart.dart';
import 'package:arator/style/theme.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ShoppingRoutePage extends StatefulWidget {
  final ShoppingCart _shoppingCart;

  ShoppingRoutePage(this._shoppingCart);

  @override
  _ShoppingRoutePageState createState() => _ShoppingRoutePageState();
}

class _ShoppingRoutePageState extends State<ShoppingRoutePage> {
  GpsService _gpsService = GpsService();
  final num mapBoxHeight = 200.0;

  @override
  void initState() {
    super.initState();
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
                        child: ShoppingRouteMap(
                          startingPosition: initialPosition,
                        ))
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
        SizedBox(height: 20),
        AppButton(
          child: Text("Start Trip"),
          onPressed: () => {
            TabNavigator.push(context, TabNavigatorRoutes.shoppingTrip,
                object: widget._shoppingCart)
          },
        )
      ],
    )));
  }
}
