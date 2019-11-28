import 'package:arator/components/buy/buy_product_overview_card.dart';
import 'package:arator/components/common/message_follow_button_row.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/common/profile_review_row.dart';
import 'package:arator/data/ProduceModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SellerUserProfileProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProduceModel>(
      builder: (context, index, produceModel) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageBodyContainer(
              child: Column(
                children: <Widget>[
                  ProfileReviewRow(
                    produceModel,
                    shouldNavigate: false,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  MessageFollowButtonRow(),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Products",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.title.fontSize),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: produceModel.nearbyProduce.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuyProduceOverviewCard(
                    produceModel.nearbyProduce[index],
                    omitHeader: true,
                  );
                },
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.85, crossAxisCount: 2),
              ),
            ),
          ]),
    );
  }
}
