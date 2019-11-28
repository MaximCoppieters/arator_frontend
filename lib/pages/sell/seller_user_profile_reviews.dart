import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/common/profile_picture.dart';
import 'package:arator/components/common/star_rating_buttons.dart';
import 'package:arator/data/ProduceModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SellerUserProfileReviews extends StatefulWidget {
  @override
  _SellerUserProfileReviewsState createState() =>
      _SellerUserProfileReviewsState();
}

class _SellerUserProfileReviewsState extends State<SellerUserProfileReviews> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProduceModel>(
        builder: (context, index, produceModel) => ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return PageBodyContainer(
                  child: Row(
                    children: <Widget>[
                      ProfilePicture(
                          // produceModel.selectedUser.reviews[index].reviewer.profileImagePath
                          "assets/images/pedro.jpg",
                          50.0,
                          produceModel),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text("Pedro Fernandez"
                                  //produceModel.selectedUser.reviews[index].reviewer.userName
                                  ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50.0),
                              ),
                              Text("8 days ago"),
                            ],
                          ),
                          StarRating(
                            value: 4,
                          ),
                          Text(
                              "Would buy from him again for sure, great seller!"),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ));
  }
}
