import 'dart:io';

import 'package:arator/components/common/tab_navigator.dart';
import 'package:arator/data/FruitModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SellerTab extends StatefulWidget {
  @override
  _SellerTabState createState() => _SellerTabState();
}

class _SellerTabState extends State<SellerTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            {TabNavigator.push(context, TabNavigatorRoutes.sellerAddProduct)},
      ),
      body: Container(
        child: ScopedModelDescendant<FruitModel>(
          builder: (context, child, model) => CustomScrollView(
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
                            text:
                                "10 products Sold\n 4 Products for sale\n€100 earnings this month\n€2100 total earnings",
                            style: Theme.of(context).tabBarTheme.labelStyle),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
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
                              model.fruits[index].species,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Image.file(
                                File(model.fruits[index].imagePath),
                              ),
                            ),
                          ],
                        )),
                      );
                    }, childCount: model.fruits.length)),
                padding: EdgeInsets.all(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
