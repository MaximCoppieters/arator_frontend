import 'package:arator/data/model/Product.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

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
              Text(
                product.name,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.title.fontSize),
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
