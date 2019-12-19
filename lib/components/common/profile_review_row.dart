import 'package:arator/components/common/profile_picture.dart';
import 'package:arator/components/common/star_rating_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileReviewRow extends StatelessWidget {
  final bool shouldNavigate;

  ProfileReviewRow({this.shouldNavigate = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfilePicture(
          "",
          50.0,
          shouldNavigate: shouldNavigate,
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.0),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Pedro Fernandez"
              // produceModel.selectedProduce.seller.userName
              ,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.body2.fontSize),
            ),
            Row(
              children: <Widget>[
                StarRating(
                  value: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                ),
                Text("44 reviews")
              ],
            ),
          ],
        ),
      ],
    );
  }
}
