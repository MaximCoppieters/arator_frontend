import 'package:arator/components/buy/increment_number_field.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/common/profile_review_row.dart';
import 'package:arator/data/Produce.dart';
import 'package:arator/data/ProduceModel.dart';
import 'package:arator/data/ShippingUnitChoice.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BuyProductDetailPage extends StatefulWidget {
  BuyProductDetailPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BuyProductDetailPage createState() => _BuyProductDetailPage();
}

class _BuyProductDetailPage extends State<BuyProductDetailPage> {
  String selected = "blue";
  bool favourite = false;
  int currentImageIndex = 0;
  List<String> imageUrls = [
    "assets/images/apples.jpg",
    "assets/images/cauliflower.jpg"
  ];
  ShippingUnitChoice selectedShippingUnit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<ProduceModel>(
        builder: (context, child, produceModel) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              productImageCarousel(),
              PageBodyContainer(
                child: Column(
                  children: <Widget>[
                    ProfileReviewRow(produceModel),
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
                      "Jonagold Apples",
                      // produceModel.selectedProduce.species,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "€21,4/kg",
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
              purchaseSection(produceModel.selectedProduce),
            ],
          ),
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
            child: Carousel(
              dotBgColor: Colors.transparent,
              dotSize: 5.0,
              autoplay: false,
              images: imageUrls
                  .map((url) => Image.asset(
                        url,
                        fit: BoxFit.fitWidth,
                      ))
                  .toList(),
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
          producePropertySection(),
        ],
      ),
    );
  }

  Widget produceDescription() {
    return Text(
      "Jonagold apples have an under blush which varies in color from greenish yellow to rosy orange depending on the strain and the temperature the apples are grown in. The skin is also covered with red spotting and vertical striping. Large in size its flesh is crisp, juicy and creamy yellow in color.",
      style: TextStyle(color: Theme.of(context).textTheme.body2.color),
    );
  }

  Widget producePropertySection() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset(
              "assets/images/pesticide_free.png",
              fit: BoxFit.fitWidth,
            ),
            width: 50.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Plant Health: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  Text(
                    "86%",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Water Efficiency: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  Text(
                    "78%",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Harvest Date: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  Text(
                    "2019-10-24",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget purchaseAmountChoices(Produce produce) {
    return Container(
      child: Column(
        children: produce.shippingUnitChoices
            .map((possibleShippingUnit) => RadioListTile(
                  title: Text(
                      "${possibleShippingUnit.amount.toString()} ${possibleShippingUnit.amountUnit}"),
                  activeColor: Theme.of(context).accentColor,
                  subtitle: Text(produce.getPricePerUnit()),
                  secondary: Text("€ 4,0",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).primaryColor)),
                  value: possibleShippingUnit,
                  groupValue: selectedShippingUnit,
                  onChanged: (value) {
                    setState(() {
                      selectedShippingUnit = value;
                    });
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget purchaseSection(Produce produce) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          purchaseAmountChoices(produce),
          Row(
            children: <Widget>[
              NumberInputWithIncrementDecrement(),
              RaisedButton(
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
                color: Colors.green,
                onPressed: () {},
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
  /***** End */
}

class ColorTicker extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback selectedCallback;
  ColorTicker({this.color, this.selected, this.selectedCallback});

  @override
  Widget build(BuildContext context) {
    print(selected);
    return GestureDetector(
        onTap: () {
          selectedCallback();
        },
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
