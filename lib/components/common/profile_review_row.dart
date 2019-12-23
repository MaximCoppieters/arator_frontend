import 'package:arator/components/common/profile_picture.dart';
import 'package:arator/components/common/star_rating_buttons.dart';
import 'package:arator/data/model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class ProfileReviewRow extends StatelessWidget {
  final bool shouldNavigate;
  final User user;

  ProfileReviewRow({@required this.user, this.shouldNavigate = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfilePicture(
          AppInfo.baseUrl + user.profileImageUrl,
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
              user.name,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.body2.fontSize),
            ),
            Row(
              children: <Widget>[
                StarRating(
                  value: user.averageRatingRounded,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                ),
                Text("${user.ratingCount} reviews")
              ],
            ),
          ],
        ),
      ],
    );
  }
}
