import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/data/model/ProductInCart.dart';
import 'package:arator/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class ShoppingCartItem extends StatefulWidget {
  final ProductInCart productInCart;

  ShoppingCartItem({@required this.productInCart});

  @override
  _ShoppingCartItemState createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  ShoppingCartBloc _shoppingCartBloc;

  @override
  void initState() {
    _shoppingCartBloc = BlocProvider.of<ShoppingCartBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 75.0,
                height: 75.0,
                child: Image.network(widget.productInCart.product.imagePath)),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.productInCart.product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    "Prijs: ${widget.productInCart.product.formattedPriceInEuro}"),
                Text("Aantal: ${widget.productInCart.amount}"),
                Text(
                    "Subtotaal: ${widget.productInCart.formattedSubtotalInEuro}"),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.remove_shopping_cart,
                  color: AratorTheme.primaryColor),
              onPressed: () {
                _shoppingCartBloc.add(
                    RemoveProductFromCart(productInCart: widget.productInCart));
              },
            )
          ],
        ),
      ),
    );
  }
}
