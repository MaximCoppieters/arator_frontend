import 'package:arator/components/PageBodyContainer.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile Settings Overview"),
      ),
      body: PageBodyContainer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset("assets/images/pedro.jpg")),
                    title: Text("Pedro Fernandez"),
                    subtitle: Text("Edit"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.my_location,
                      color: Colors.green,
                    ),
                    title: Text("My Location Settings"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.message,
                      color: Colors.green,
                    ),
                    title: Text("Messages"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.green,
                    ),
                    title: Text("Preferences"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.shopping_basket,
                      color: Colors.green,
                    ),
                    title: Text("My Shopping Cart"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.shop_two,
                      color: Colors.green,
                    ),
                    title: Text("Transaction History"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person_add,
                      color: Colors.green,
                    ),
                    title: Text("Invite A Friend"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.green,
                    ),
                    title: Text("Settings"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.green,
                    ),
                    title: Text("Log Out"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
