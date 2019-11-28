import 'package:arator/components/buy/buy_product_overview_card.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/common/profile_review_row.dart';
import 'package:arator/data/ProduceModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SellerUserProfile extends StatefulWidget {
  @override
  _SellerUserProfileState createState() => _SellerUserProfileState();
}

class _SellerUserProfileState extends State<SellerUserProfile> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProduceModel>(
        builder: (context, index, produceModel) => Scaffold(
              appBar: AppBar(
                  title: Text("Pedro Fernandez"
                      // produceModel.selectedUser.userName
                      )),
              body: Column(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                onPressed: () => {},
                                child: Text("Message"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                            Expanded(
                              child: RaisedButton(
                                onPressed: () => {},
                                child: Text("Leave Review"),
                              ),
                            )
                          ],
                        ),
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
                    child: ScopedModelDescendant<ProduceModel>(
                      builder: (context, child, produceModel) =>
                          GridView.builder(
                        itemCount: produceModel.nearbyProduce.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BuyProduceOverviewCard(
                            produceModel.nearbyProduce[index],
                            omitHeader: true,
                          );
                        },
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.85, crossAxisCount: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
