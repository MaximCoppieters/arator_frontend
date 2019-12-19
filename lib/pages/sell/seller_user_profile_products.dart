import 'package:arator/components/buy/buy_product_overview_card.dart';
import 'package:arator/components/common/message_follow_button_row.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/common/profile_review_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SellerUserProfileProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PageBodyContainer(
          child: Column(
            children: <Widget>[
              ProfileReviewRow(
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
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return BuyProduceOverviewCard(
                null,
                omitHeader: true,
              );
            },
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.85, crossAxisCount: 2),
          ),
        ),
      ],
    );
  }
}
