import 'package:arator/data/model/Product.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class SellProductOverviewCard extends StatelessWidget {
  final Product product;
  SellProductOverviewCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.of(context).pushNamed("/seller_product_detail")},
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
              Image.network(AppInfo.baseUrl + product.imageUrl,
                  fit: BoxFit.fill)
            ],
          )),
    );
  }
}
