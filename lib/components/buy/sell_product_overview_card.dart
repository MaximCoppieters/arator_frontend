import 'package:arator/data/model/Product.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';

class SellProductOverviewCard extends StatelessWidget {
  final Product product;
  SellProductOverviewCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TabNavigator.push(context, TabNavigatorRoutes.sellerProductDetail,
            object: product);
      },
      child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              Container(
                color: Theme.of(context).colorScheme.secondary,
                padding: EdgeInsets.symmetric(vertical: 5.0),
                width: double.infinity,
                child: Text(
                  product.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.title.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: Hero(
                  tag: "sell-product-detail",
                  child: Image.network(
                    product.imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
