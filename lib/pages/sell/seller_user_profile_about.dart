import 'package:arator/components/common/IconText.dart';
import 'package:arator/components/common/message_follow_button_row.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/data/model/User.dart';
import 'package:flutter/material.dart';

class SellerUserProfileAbout extends StatelessWidget {
  final User user;
  SellerUserProfileAbout({this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.network(user.profileImagePath),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageBodyContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user.name,
                      style: TextStyle(
                          fontWeight:
                              Theme.of(context).textTheme.title.fontWeight,
                          fontSize: Theme.of(context).textTheme.title.fontSize),
                      //produceModel.selectedUser.userName
                    ),
                    Text(
                      user.about,
                      style: TextStyle(
                          fontWeight:
                              Theme.of(context).textTheme.body1.fontWeight,
                          fontSize: Theme.of(context).textTheme.body1.fontSize),
                      //produceModel.selectedUser.userName
                    ),
                  ],
                )),
                Divider(),
                PageBodyContainer(
                  child: Column(
                    children: <Widget>[
                      IconText(Icons.timer, "Last seen at 04:00 PM"),
                      IconText(Icons.rss_feed, "91 followers"),
                      IconText(Icons.location_city, "Lleida"),
                      SizedBox(
                        height: 10.0,
                      ),
                      MessageFollowButtonRow(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
