import 'package:arator/components/buy/buy_product_overview_card.dart';
import 'package:arator/components/common/bottom_navigation.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/common/profile_review_row.dart';
import 'package:arator/data/ProduceModel.dart';
import 'package:arator/pages/sell/seller_user_profile_about.dart';
import 'package:arator/pages/sell/seller_user_profile_products.dart';
import 'package:arator/pages/sell/seller_user_profile_reviews.dart';
import 'package:flutter/cupertino.dart';
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
        builder: (context, index, produceModel) => DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                    bottom: TabBar(
                      tabs: <Widget>[
                        Tab(
                          text: "Products",
                        ),
                        Tab(
                          text: "About",
                        ),
                        Tab(
                          text: "Reviews",
                        ),
                      ],
                    ),
                    title: Text("Pedro Fernandez"
                        // produceModel.selectedUser.userName
                        )),
                body: TabBarView(
                  children: <Widget>[
                    SellerUserProfileProducts(),
                    SellerUserProfileAbout(),
                    SellerUserProfileReviews()
                  ],
                ),
              ),
            ));
  }
}
