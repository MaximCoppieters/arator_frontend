import 'package:arator/components/buy/increment_number_field.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: 75.0,
                      height: 75.0,
                      child: Image.asset(
                        "assets/images/apples.jpg",
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Amandelen bruin gezouten 450 gram"),
                      Text("Prijs: € 3,95"),
                      NumberInputWithIncrementDecrement(),
                      Text("Subtotaal: € 3,95"),
                      Text("Delete")
                    ],
                  ),
                ],
              ),
            ),
          ),
          PaymentSummary()
        ],
      ),
    );
  }
}

class PaymentSummary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaymentSummaryState();
  }
}

class _PaymentSummaryState extends State<PaymentSummary> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: PageBodyContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Summary",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.title.fontSize,
                  fontWeight: FontWeight.bold),
            ),
            PaymentRow("Subtotal", "€ 3,95"),
            PaymentRow("BTW", "€ 0,22"),
            Divider(),
            PaymentRow("Totaal", "€ 3,95"),
            SizedBox(
              height: 8.0,
            ),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.6,
                child: RaisedButton(
                  child: Text("Checkout"),
                  onPressed: () => {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentRow extends StatefulWidget {
  final String title;
  final String amount;

  PaymentRow(this.title, this.amount);
  @override
  State<StatefulWidget> createState() {
    return _PaymentRowState(title, amount);
  }
}

class _PaymentRowState extends State<PaymentRow> {
  final String title;
  final String amount;
  _PaymentRowState(this.title, this.amount);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text(title), Text(amount)],
      ),
    );
  }
}
