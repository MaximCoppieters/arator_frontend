import 'package:arator/business/bloc/product_bloc.dart';
import 'package:arator/business/bloc/product_event.dart';
import 'package:arator/business/gps_service.dart';
import 'package:arator/components/buy/buy_product_grid_view.dart';
import 'package:arator/data/model/MapLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class BuyerProductOverview extends StatefulWidget {
  @override
  _BuyerProductOverviewState createState() => _BuyerProductOverviewState();
}

class _BuyerProductOverviewState extends State<BuyerProductOverview> {
  ProductBloc _productBloc;
  GpsService _gpsService = GpsService();

  @override
  void initState() {
    _productBloc = BlocProvider.of<BuyerProductBloc>(context);
    loadProductsFromLocation();
    super.initState();
  }

  Future<void> loadProductsFromLocation() async {
    Position position = await _gpsService.getUserPosition();
    var userLocation = MapLocation(position: position);

    _productBloc.add(GetProducts(location: userLocation));
  }

  @override
  void dispose() {
    _productBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Overview"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () => {},
            )
          ],
        ),
        body: BuyProductGridView(
          reloadFunction: loadProductsFromLocation,
        ));
  }
}
