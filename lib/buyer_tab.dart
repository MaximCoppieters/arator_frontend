import 'package:flutter/material.dart';

import 'components/PageBodyContainer.dart';

class BuyerTab extends StatefulWidget {
  @override
  _BuyerTabState createState() => _BuyerTabState();
}

class _BuyerTabState extends State<BuyerTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Overview"),
      ),
      body: PageBodyContainer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              child: Text(
                                "Cauliflower",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            ConstrainedBox(
                              child: Container(
                                  child: Image.asset(
                                      "assets/images/cauliflower.jpg")),
                              constraints: BoxConstraints(maxHeight: 120.0),
                            ),
                            Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    "Pedro Fernandez",
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "2,5km",
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "€5,30/kg",
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
