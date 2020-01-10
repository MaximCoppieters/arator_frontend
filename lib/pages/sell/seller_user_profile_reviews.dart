import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/common/profile_picture.dart';
import 'package:arator/components/common/star_rating_buttons.dart';
import 'package:arator/data/model/User.dart';
import 'package:flutter/material.dart';

class SellerUserProfileReviews extends StatefulWidget {
  final User user;
  SellerUserProfileReviews({this.user});

  @override
  _SellerUserProfileReviewsState createState() =>
      _SellerUserProfileReviewsState();
}

class _SellerUserProfileReviewsState extends State<SellerUserProfileReviews> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return PageBodyContainer(
            child: Row(
              children: <Widget>[
                ProfilePicture(widget.user, 50.0),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(widget.user.name),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                        ),
                        Text("8 days ago"),
                      ],
                    ),
                    StarRating(
                      value: 4,
                    ),
                    Text("Would buy from him again for sure, great seller!"),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
