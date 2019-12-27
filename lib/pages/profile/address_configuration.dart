import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/gps_service.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/elements/button.dart';
import 'package:arator/components/elements/text_field.dart';
import 'package:arator/components/maps/map_address_picker.dart';
import 'package:arator/data/model/UserAddress.dart';
import 'package:arator/style/theme.dart';
import 'package:arator/utils/exceptions/gps_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AddressConfiguration extends StatefulWidget {
  @override
  _AddressConfigurationState createState() => _AddressConfigurationState();
}

class _AddressConfigurationState extends State<AddressConfiguration> {
  final TextEditingController _addressController = TextEditingController();
  final FocusNode _addressFocusNode = FocusNode();
  final num mapBoxHeight = 200.0;
  final GpsService _gpsService = GpsService();
  bool initialLoad = true;
  String _addressErrorText;

  LocationBloc _locationBloc;
  Future<Position> initialPosition;

  @override
  void initState() {
    _locationBloc = BlocProvider.of<LocationBloc>(context);
    _locationBloc.listen(updateAddress);
    super.initState();
  }

  updateAddress(LocationState locationState) {
    _addressErrorText = "";
    if (locationState is LocationLoaded) {
      _addressController.text = locationState.location.address.addressLine;
    } else if (locationState is AddressSaveFailed) {
      GpsException error = locationState.props.first;
      _addressErrorText = error.message;
    }
  }

  saveAddress() {
    var userAddress = UserAddress(addressLine: _addressController.text);
    _locationBloc.add(SaveUserAddress(userAddress));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Configure address"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PageBodyContainer(
                    child: BlocBuilder<LocationBloc, LocationState>(
                        bloc: _locationBloc,
                        builder: (context, locationState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AppTextField(
                                controller: _addressController,
                                focusNode: _addressFocusNode,
                                hintText: "Address",
                                errorText: _addressErrorText,
                                decorationIconData: FontAwesomeIcons.map,
                              ),
                              SizedBox(height: 5.0),
                              Row(
                                children: <Widget>[
                                  AppButton(
                                    onPressed: saveAddress,
                                    child: Text("Save"),
                                  ),
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                  locationState is AddressSaving
                                      ? CircularProgressIndicator()
                                      : Container(),
                                ],
                              )
                            ],
                          );
                        }),
                  ),
                  FutureBuilder(
                      future: _gpsService.getUserPosition(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Position initialPosition = snapshot.data;
                          return Column(
                            children: <Widget>[
                              PageBodyContainer(
                                  child: Text("Choose on map",
                                      style: AratorTheme.styles.headlineStyle)),
                              Container(
                                  height: 200.0,
                                  child: MapAddressPicker(
                                      startingPosition: initialPosition))
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Container(
                              height: mapBoxHeight,
                              child: Text(snapshot.error.toString()));
                        } else {
                          return Container(
                            height: mapBoxHeight,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}
