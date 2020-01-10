import 'package:arator/business/bloc/product_bloc.dart';
import 'package:arator/business/bloc/product_event.dart';
import 'package:arator/business/bloc/product_state.dart';
import 'package:arator/components/buy/buy_product_grid_view.dart';
import 'package:arator/components/elements/button.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerProductOverview extends StatefulWidget {
  @override
  _BuyerProductOverviewState createState() => _BuyerProductOverviewState();
}

class _BuyerProductOverviewState extends State<BuyerProductOverview> {
  ProductBloc _productBloc;

  @override
  void initState() {
    _productBloc = BlocProvider.of<BuyerProductBloc>(context);
    _productBloc.add(GetProducts());
    super.initState();
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
        ),
        body: BuyProductGridView());
  }
}
