import 'package:arator/components/buy/buy_product_overview_card.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/data/FruitModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BuyerTab extends StatefulWidget {
  @override
  _BuyerTabState createState() => _BuyerTabState();
}

class _BuyerTabState extends State<BuyerTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Overview"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ScopedModelDescendant<ProduceModel>(
              builder: (context, child, produceModel) => GridView.builder(
                itemCount: produceModel.nearbyProduce.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuyProduceOverviewCard(
                      produceModel.nearbyProduce[index]);
                },
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8, crossAxisCount: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
