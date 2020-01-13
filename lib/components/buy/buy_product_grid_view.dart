import 'package:arator/business/bloc/product_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:arator/business/bloc/product_event.dart';
import 'package:arator/business/bloc/product_state.dart';
import 'package:arator/components/buy/buy_product_overview_card.dart';
import 'package:arator/components/elements/button.dart';
import 'package:arator/data/model/Product.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyProductGridView extends StatefulWidget {
  final bool omitHeaders;
  final num childAspectRatio;
  final Function reloadFunction;
  BuyProductGridView(
      {this.omitHeaders = false,
      this.childAspectRatio = 0.7,
      @required this.reloadFunction});

  @override
  _BuyProductGridViewState createState() => _BuyProductGridViewState();
}

class _BuyProductGridViewState extends State<BuyProductGridView> {
  ProductBloc _productBloc;

  @override
  void initState() {
    _productBloc = BlocProvider.of<BuyerProductBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
        bloc: _productBloc,
        builder: (context, productState) {
          if (productState is ProductsFailedLoading) {
            FormException error = productState.props[0];
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(error.message),
                AppButton(
                  child: Text("Retry"),
                  onPressed: () {
                    _productBloc.add(GetProducts());
                  },
                ),
              ],
            ));
          } else if (productState is ProductsLoaded) {
            List<Product> products = productState.props.first;
            return Column(children: <Widget>[
              Expanded(
                  child: LiquidPullToRefresh(
                onRefresh: widget.reloadFunction,
                child: GridView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BuyProduceOverviewCard(
                      products[index],
                      omitHeader: widget.omitHeaders,
                    );
                  },
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: widget.childAspectRatio,
                      crossAxisCount: 2),
                ),
              )),
            ]);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
