import 'package:arator/business/bloc/product_bloc.dart';
import 'package:arator/business/bloc/product_event.dart';
import 'package:arator/business/bloc/product_state.dart';
import 'package:arator/components/buy/buy_product_overview_card.dart';
import 'package:arator/data/model/Product.dart';
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
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc.add(GetPersonalProducts());
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
          if (state is ProductsFailedLoading) {
            FormException error = state.props[0];
            return Center(child: Text(error.message));
          } else if (state is ProductsLoaded) {
            return buildProductList(state.products);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildProductList(List<Product> products) {
    return Column(children: <Widget>[
      Expanded(
          child: GridView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return BuyProduceOverviewCard(products[index]);
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
