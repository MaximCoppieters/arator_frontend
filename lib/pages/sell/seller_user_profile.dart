import 'package:arator/pages/sell/seller_user_profile_about.dart';
import 'package:arator/pages/sell/seller_user_profile_products.dart';
import 'package:arator/pages/sell/seller_user_profile_reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SellerUserProfile extends StatefulWidget {
  @override
  _SellerUserProfileState createState() => _SellerUserProfileState();
}

class _SellerUserProfileState extends State<SellerUserProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
    );
  }
}
