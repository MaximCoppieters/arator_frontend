import 'package:arator/components/common/tab_navigator.dart';
import 'package:arator/data/FruitModel.dart';
import 'package:arator/data/Produce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BuyProduceOverviewCard extends StatelessWidget {
  final Produce produce;

  BuyProduceOverviewCard(this.produce);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProduceModel>(
      builder: (context, child, produceModel) => GestureDetector(
        onTap: () => {
          produceModel.selectProduce(this.produce),
          TabNavigator.push(context, TabNavigatorRoutes.buyProductDetail)
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                          width: 25.0,
                          child: Image.asset(
                            "assets/images/pedro.jpg",
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.5),
                    ),
                    Text(produce.seller.userName),
                  ],
                ),
              ),
              Image.asset(produce.imagePath,
                  height: 150.0, fit: BoxFit.fitHeight),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  alignment: Alignment.topLeft,
                  child: Row(children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            " ${produce.priceUnit} ${produce.price} / ${produce.amountUnit}",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .subtitle
                                    .fontSize,
                                fontWeight: FontWeight.bold)),
                        Text("${produce.distance} away",
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
      ),
    );
  }
}
