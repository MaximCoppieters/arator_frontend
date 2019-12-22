import 'package:arator/data/model/Product.dart';
import 'package:flutter/material.dart';

class SellerProductDetail extends StatefulWidget {
  final Product product;
  SellerProductDetail({this.product});
  @override
  _SellerProductDetailState createState() =>
      _SellerProductDetailState(product: product);
}

class _SellerProductDetailState extends State<SellerProductDetail> {
  final Product product;
  _SellerProductDetailState({this.product});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(product.name));
  }
}
