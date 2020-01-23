import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/bloc/product_bloc.dart';
import 'package:arator/components/buy/buy_product_grid_view.dart';
import 'package:arator/components/common/message_follow_button_row.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/common/profile_review_row.dart';
import 'package:arator/data/model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerUserProfileProducts extends StatefulWidget {
  final User user;
  SellerUserProfileProducts({this.user});

  @override
  _SellerUserProfileProductsState createState() =>
      _SellerUserProfileProductsState();
}

class _SellerUserProfileProductsState extends State<SellerUserProfileProducts> {
  ProductBloc _productBloc;

  @override
  initState() {
    _productBloc = BlocProvider.of<BuyerProductBloc>(context);
    super.initState();
  }

  @override
  dispose() {
    _productBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          child: PageBodyContainer(
            child: Column(
              children: <Widget>[
                ProfileReviewRow(
                  user: widget.user,
                  shouldNavigate: false,
                ),
                SizedBox(
                  height: 5.0,
                ),
                MessageFollowButtonRow(),
              ],
            ),
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
            child: BuyProductGridView(
          reloadFunction: () => {_productBloc.add(GetProducts())},
          omitHeaders: true,
          childAspectRatio: 0.85,
        )),
      ],
    );
  }
}
