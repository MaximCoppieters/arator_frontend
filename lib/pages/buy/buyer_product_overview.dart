import 'package:arator/business/bloc/product_bloc.dart';
import 'package:arator/business/bloc/product_event.dart';
import 'package:arator/business/bloc/product_state.dart';
import 'package:arator/components/buy/buy_product_overview_card.dart';
import 'package:arator/data/model/Produce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerProductOverview extends StatefulWidget {
  @override
  _BuyerProductOverviewState createState() => _BuyerProductOverviewState();
}

class _BuyerProductOverviewState extends State<BuyerProductOverview> {
  @override
  void initState() {
    final _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc.add(GetProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Overview"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductsLoading || state is InitialProductState) {
            return CircularProgressIndicator();
          } else if (state is ProductsLoaded) {
            return buildProductList(state.products);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget buildProductList(List<Produce> products) {
    return Column(children: <Widget>[
      Expanded(
          child: GridView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return BuyProduceOverviewCard(null);
        },
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8, crossAxisCount: 2),
      )),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
