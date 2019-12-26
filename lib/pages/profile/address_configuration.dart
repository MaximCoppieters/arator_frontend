import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/maps/map_address_picker.dart';
import 'package:flutter/material.dart';

class AddressConfiguration extends StatefulWidget {
  @override
  _AddressConfigurationState createState() => _AddressConfigurationState();
}

class _AddressConfigurationState extends State<AddressConfiguration> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: double.infinity,
                height: 200.0,
                child: MapAddressPicker())
          ],
        ));
  }
}
