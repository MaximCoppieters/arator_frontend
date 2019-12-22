import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/components/buy/sell_product_overview_card.dart';
import 'package:arator/data/model/Product.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerProductOverview extends StatefulWidget {
  @override
  _SellerProductOverviewState createState() => _SellerProductOverviewState();
}

class _SellerProductOverviewState extends State<SellerProductOverview> {
  ProductBloc _productBloc;

  @override
  void initState() {
    _productBloc = BlocProvider.of<SellerProductBloc>(context);
    _productBloc.add(GetProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            {TabNavigator.push(context, TabNavigatorRoutes.sellerAddProduct)},
      ),
      body: Container(
        child: BlocBuilder<SellerProductBloc, ProductState>(
            bloc: _productBloc,
            builder: (context, productState) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    title: Text(
                      "My Products",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    floating: true,
                    expandedHeight: 250.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        "assets/images/produce.jpg",
                        fit: BoxFit.cover,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: productState is ProductsLoading
                                    ? "Loading"
                                    : "10 products Sold\n 4 Products for sale\n€100 earnings this month\n€2100 total earnings",
                                style:
                                    Theme.of(context).tabBarTheme.labelStyle),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    sliver: getContent(productState),
                    padding: EdgeInsets.all(2),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget getContent(ProductState productState) {
    if (productState is ProductsFailedLoading) {
      return SliverFillRemaining(
          child: Center(
        child: Text("Unable to get products from server"),
      ));
    } else if (productState is ProductsLoaded) {
      List<Product> products =
          productState is ProductsLoaded ? productState.props[0] : [];

      return SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 30.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.3),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return SellProductOverviewCard(products[index]);
          }, childCount: products.length));
    } else {
      return SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    }
  }
}
