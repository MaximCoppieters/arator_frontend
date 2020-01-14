import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/components/buy/increment_number_field.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/common/profile_review_row.dart';
import 'package:arator/components/elements/button.dart';
import 'package:arator/data/model/Product.dart';
import 'package:arator/data/model/ProductInCart.dart';
import 'package:arator/tab_navigator.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyProductDetailPage extends StatefulWidget {
  final Product product;
  BuyProductDetailPage({this.product});

  @override
  _BuyProductDetailPageState createState() => _BuyProductDetailPageState();
}

class _BuyProductDetailPageState extends State<BuyProductDetailPage> {
  _BuyProductDetailPageState();

  String selected = "blue";
  bool favourite = false;
  int currentImageIndex = 0;
  ShoppingCartBloc _shoppingCartBloc;

  TextEditingController _buyAmountController = TextEditingController();

  @override
  void initState() {
    _shoppingCartBloc = BlocProvider.of<ShoppingCartBloc>(context);
    if (_shoppingCartBloc.shoppingCart == null) {
      _shoppingCartBloc.add(LoadShoppingCart());
    }
    _shoppingCartBloc.listen((state) {
      if (state is ItemAdded) {
        TabNavigator.push(context, TabNavigatorRoutes.buy);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _shoppingCartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            productImageCarousel(),
            Card(
              child: Column(
                children: <Widget>[
                  PageBodyContainer(
                    child: Column(
                      children: <Widget>[
                        ProfileReviewRow(user: widget.product.seller),
                      ],
                    ),
                  ),
                  Divider(),
                  PageBodyContainer(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${widget.product.type} ${widget.product.name}",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.product.priceInEuro}",
                          // produceModel.selectedProduce.getPricePerUnit(),
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          "24km away",
                          //produceModel.selectedProduce.distance,
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        produceSections(),
                      ],
                    ),
                  ),
                  purchaseSection(null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productImageCarousel() {
    return Stack(
      children: <Widget>[
        SizedBox(
            height: 260.0,
            width: double.infinity,
            child: Hero(
              tag: "buy-product-detail",
              child: Carousel(
                dotBgColor: Colors.transparent,
                dotSize: 5.0,
                autoplay: false,
                images: [widget.product.imagePath]
                    .map((url) => Image.network(
                          url,
                          fit: BoxFit.fitWidth,
                        ))
                    .toList(),
              ),
            )),
        Positioned(
            child: BackButton(
              color: Colors.white,
            ),
            top: 10,
            left: 5),
      ],
    );
  }

  Widget produceSections() {
    return Container(
      child: Column(
        children: <Widget>[
          produceDescription(),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget produceDescription() {
    return Text(
      widget.product.description,
      style: TextStyle(color: Theme.of(context).textTheme.body2.color),
    );
  }

  Widget purchaseAmountChoices(Product produce) {
    return Container(
      child: Column(
        children: []
            .map((possibleShippingUnit) => RadioListTile(
                  title: Text("Unit"),
                  activeColor: Theme.of(context).accentColor,
                  subtitle: Text(""),
                  secondary: Text("€ 4,0",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).primaryColor)),
                  value: possibleShippingUnit,
                  groupValue: 1,
                  onChanged: (value) {
                    setState(() => {});
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget purchaseSection(Product produce) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          purchaseAmountChoices(produce),
          Row(
            children: <Widget>[
              NumberInputWithIncrementDecrement(
                controller: _buyAmountController,
              ),
              AppButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.shopping_basket, color: Colors.white),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      "Add To Basket",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {
                  var productInCart = new ProductInCart();
                  productInCart.product = widget.product;
                  productInCart.amount = num.parse(_buyAmountController.text);
                  _shoppingCartBloc
                      .add(AddProductToCart(productInCart: productInCart));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget spaceVertical(double size) {
    return SizedBox(
      height: size,
    );
  }

  Widget spaceHorizontal(double size) {
    return SizedBox(
      width: size,
    );
  }
}

class ColorTicker extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback selectedCallback;
  ColorTicker({this.color, this.selected, this.selectedCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: selectedCallback,
        child: Container(
          padding: EdgeInsets.all(7),
          margin: EdgeInsets.all(5),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: color.withOpacity(0.7)),
          child: selected ? Image.asset("images/checker.png") : Container(),
        ));
  }
}
