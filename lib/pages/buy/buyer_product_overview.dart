import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/bloc/product_bloc.dart';
import 'package:arator/business/bloc/product_event.dart';
import 'package:arator/business/gps_service.dart';
import 'package:arator/components/UI.dart';
import 'package:arator/components/buy/buy_product_grid_view.dart';
import 'package:arator/data/model/MapLocation.dart';
import 'package:arator/style/theme.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class BuyerProductOverview extends StatefulWidget {
  @override
  _BuyerProductOverviewState createState() => _BuyerProductOverviewState();
}

class _BuyerProductOverviewState extends State<BuyerProductOverview> {
  ProductBloc _productBloc;
  ShoppingCartBloc _shoppingCartBloc;
  GpsService _gpsService = GpsService();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _productBloc = BlocProvider.of<BuyerProductBloc>(context);
    _shoppingCartBloc = BlocProvider.of<ShoppingCartBloc>(context);
    if (_shoppingCartBloc.shoppingCart == null) {
      _shoppingCartBloc.add(LoadShoppingCart());
    }
    _shoppingCartBloc.listen((state) {
      if (state is ItemAdded) {
        UI.showInSnackBar(context, _scaffoldKey, "Item added to shopping cart");
        _shoppingCartBloc.add(ResetShoppingCartState());
      }
    });
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
    _shoppingCartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Product Overview"),
          actions: <Widget>[
            GestureDetector(
              onTap: () => {
                TabNavigator.push(
                    context, TabNavigatorRoutes.shoppingCartOverview)
              },
              child: new Stack(
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(
                      Icons.shopping_cart,
                      color: AratorTheme.primaryColor,
                    ),
                    onPressed: null,
                  ),
                  _shoppingCartBloc.shoppingCart == null ||
                          _shoppingCartBloc
                                  .shoppingCart.productsInCart.length ==
                              0
                      ? new Container()
                      : new Positioned(
                          child: new Stack(
                          children: <Widget>[
                            new Icon(Icons.brightness_1,
                                size: 20.0, color: AratorTheme.secondaryColor),
                            new Positioned(
                                top: 3.0,
                                right: 4.0,
                                child: new Center(
                                  child: new Text(
                                    _shoppingCartBloc
                                        .shoppingCart.productsInCart.length
                                        .toString(),
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        )),
                ],
              ),
            )
          ],
        ),
        body: BuyProductGridView(
          reloadFunction: loadProductsFromLocation,
        ));
  }
}
