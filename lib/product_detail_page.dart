import 'package:arator/star_rating.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProductDetailPage createState() => _ProductDetailPage();
}

class _ProductDetailPage extends State<ProductDetailPage> {
  String selected = "blue";
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //The whole application area
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  BackButton(),
                  Text(
                    "Jonagold apples",
                    style: TextStyle(fontSize: 24.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              hero(),
              StarRating(
                value: 4,
                onChanged: (int index) {},
              ),
              //Center Items
              Expanded(
                child: sections(),
              ),

              //Bottom Button
              purchase()
            ],
          ),
        ),
      ),
    );
  }

  ///************** Hero   ***************************************************/

  Widget hero() {
    return Container(
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 220.0,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Image.asset(
                  "assets/images/apples.jpg",
                ),
              ),
              // should be a paged
              // view.
              Positioned(
                child: FloatingActionButton(
                    elevation: 2,
                    child: Image.asset(
                      favourite
                          ? "assets/images/heart_icon.png"
                          : "assets/images/heart_icon_disabled.png",
                      width: 20,
                      height: 20,
                    ),
                    backgroundColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        favourite = !favourite;
                      });
                    }),
                bottom: 10,
                right: 10,
              ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "€1,00/kg",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "2,54km away",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "Sold by:",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "Pedro Fernandez",
                style: TextStyle(fontSize: 14.0),
              )
            ],
          )
        ],
      ),
    );
  }

  /***** End */

  ///************ SECTIONS  *************************************************/

  Widget sections() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          description(),
          SizedBox(
            height: 10.0,
          ),
          property(),
        ],
      ),
    );
  }

  Widget description() {
    return Text(
      "Jonagold apples have an under blush which varies in color from greenish yellow to rosy orange depending on the strain and the temperature the apples are grown in. The skin is also covered with red spotting and vertical striping. Large in size its flesh is crisp, juicy and creamy yellow in color.",
      textAlign: TextAlign.justify,
      style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
    );
  }

  Widget property() {
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

  Widget colorSelector() {
    return Container(
      child: Row(
        children: <Widget>[
          ColorTicker(
              color: Colors.blue,
              selected: selected == "blue",
              selectedCallback: () {
                setState(() {
                  selected = "blue";
                });
              }),
          ColorTicker(
              color: Colors.green,
              selected: selected == "green",
              selectedCallback: () {
                setState(() {
                  selected = "green";
                });
              }),
          ColorTicker(
            color: Colors.yellow,
            selected: selected == "yellow",
            selectedCallback: () {
              setState(() {
                selected = "yellow";
              });
            },
          ),
          ColorTicker(
            color: Colors.pink,
            selected: selected == "pink",
            selectedCallback: () {
              setState(() {
                selected = "pink";
              });
            },
          ),
        ],
      ),
    );
  }

  Widget size() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Size",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F2F3E)),
        ),
        spaceVertical(10),
        Container(
          width: 70,
          padding: EdgeInsets.all(10),
          color: Color(0xFFF5F8FB),
          child: Text(
            "10.1",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F2F3E)),
          ),
        )
      ],
    );
  }

  /***** End */

  ///************** BOTTOM BUTTON ********************************************/
  Widget purchase() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 100.0,
                child: TextField(
                  decoration: new InputDecoration(labelText: "Amount (kg)"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(
                r"Total: €1,80",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w100,
                    color: Color(0xFF2F2F3E)),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text(
              "ADD TO BASKET",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)),
            ),
            color: Colors.green,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  /***** End */

  ///************** UTILITY WIDGET ********************************************/

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
