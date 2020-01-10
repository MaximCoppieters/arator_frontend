import 'package:arator/components/common/profile_picture.dart';
import 'package:arator/data/model/Product.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyProduceOverviewCard extends StatelessWidget {
  final Product product;
  final bool omitHeader;

  BuyProduceOverviewCard(this.product, {this.omitHeader = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        TabNavigator.push(context, TabNavigatorRoutes.buyProductDetail,
            object: product)
      },
      child: Card(
        child: Column(
          children: <Widget>[
            omitHeader
                ? Container()
                : Container(
                    color: Theme.of(context).colorScheme.primary,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        ProfilePicture(product.seller, 25.0),
                        Padding(
                          padding: EdgeInsets.only(left: 7.5),
                        ),
                        Text(
                          product.seller.name,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
            Hero(
              tag: "buy-product-detail",
              child: Image.network(product.imagePath,
                  height: 150.0, fit: BoxFit.fitHeight),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                alignment: Alignment.topLeft,
                child: Row(children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(product.priceInEuro.toString(),
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize:
                                  Theme.of(context).textTheme.subtitle.fontSize,
                              fontWeight: FontWeight.bold)),
                      Text("2,5 km away",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                            fontSize:
                                Theme.of(context).textTheme.subtitle.fontSize,
                          )),
                      Text("5kg left",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                            fontSize:
                                Theme.of(context).textTheme.subtitle.fontSize,
                          )),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: FlatButton(
                      onPressed: () => {},
                      child: Image.asset(
                        "assets/images/heart_icon.png",
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
