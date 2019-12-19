import 'package:arator/components/common/IconText.dart';
import 'package:arator/components/common/message_follow_button_row.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:flutter/material.dart';

class SellerUserProfileAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset("assets/images/pedro.jpg"),
          ),
          PageBodyContainer(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Pedro Fernandez",
                style: TextStyle(
                    fontWeight: Theme.of(context).textTheme.title.fontWeight,
                    fontSize: Theme.of(context).textTheme.title.fontSize),
                //produceModel.selectedUser.userName
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: TextStyle(
                    fontWeight: Theme.of(context).textTheme.body1.fontWeight,
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
                MessageFollowButtonRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
