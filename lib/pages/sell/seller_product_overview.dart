import 'package:arator/business/bloc/bloc.dart';
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
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc.add(GetPersonalProducts());
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
        child: BlocBuilder<ProductBloc, ProductState>(
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
                    sliver: productState is ProductsLoading
                        ? SliverFillRemaining(
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200.0,
                                    mainAxisSpacing: 30.0,
                                    crossAxisSpacing: 10.0,
                                    childAspectRatio: 1.5),
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => {
                                  Navigator.of(context)
                                      .pushNamed("/seller_product_detail")
                                },
                                child: Card(
                                    child: Column(
                                  children: <Widget>[
                                    Text(
                                      "species",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                  ],
                                )),
                              );
                            }, childCount: 1)),
                    padding: EdgeInsets.all(2),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
