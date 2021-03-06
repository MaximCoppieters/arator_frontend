import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/components/buy/shopping_cart_item.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/elements/button.dart';
import 'package:arator/data/model/ShoppingCart.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartOverview extends StatefulWidget {
  @override
  _ShoppingCartOverviewState createState() => _ShoppingCartOverviewState();
}

class _ShoppingCartOverviewState extends State<ShoppingCartOverview> {
  ShoppingCartBloc _shoppingCartBloc;
  ShoppingCart _shoppingCart;

  @override
  void initState() {
    _shoppingCartBloc = BlocProvider.of<ShoppingCartBloc>(context);
    _shoppingCartBloc.add(LoadShoppingCart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
            bloc: _shoppingCartBloc,
            builder: (context, shoppingCartState) {
              if (shoppingCartState is ShoppingCartLoaded) {
                _shoppingCart = shoppingCartState.props[0];
                return Column(
                    children: _shoppingCart.productsInCart
                        .map((productInCart) =>
                            ShoppingCartItem(productInCart: productInCart)
                                as Widget)
                        .toList()
                          ..add(_shoppingCart.productsInCart.length > 0
                              ? PaymentSummary()
                              : Center(
                                  child: Text(
                                      "There are no items in your shopping cart"))));
              } else if (shoppingCartState is ShoppingCartLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(child: Text("Fail"));
              }
            }),
      ),
    );
  }
}

class PaymentSummary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaymentSummaryState();
  }
}

class _PaymentSummaryState extends State<PaymentSummary> {
  ShoppingCartBloc _shoppingCartBloc;

  @override
  void initState() {
    _shoppingCartBloc = BlocProvider.of<ShoppingCartBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: PageBodyContainer(
        child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
            bloc: _shoppingCartBloc,
            builder: (context, state) {
              if (state is ShoppingCartLoaded) {
                ShoppingCart shoppingCart = state.props[0];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Summary",
                      style: TextStyle(
                          fontSize: Theme.of(context).textTheme.title.fontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    PaymentRow(
                        "Subtotal", shoppingCart.formattedSubtotalInEuro),
                    PaymentRow("BTW", shoppingCart.formattedBtwInEuro),
                    Divider(),
                    PaymentRow("Totaal", shoppingCart.formattedTotalInEuro),
                    SizedBox(
                      height: 8.0,
                    ),
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        child: AppButton(
                          child: Text("Calculate Route"),
                          onPressed: () => {
                            TabNavigator.push(
                                context, TabNavigatorRoutes.shoppingTrip,
                                object: shoppingCart)
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}

class PaymentRow extends StatefulWidget {
  final String title;
  final String amount;

  PaymentRow(this.title, this.amount);
  @override
  State<StatefulWidget> createState() {
    return _PaymentRowState(title, amount);
  }
}

class _PaymentRowState extends State<PaymentRow> {
  final String title;
  final String amount;
  _PaymentRowState(this.title, this.amount);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text(title), Text(amount)],
      ),
    );
  }
}
