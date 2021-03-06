import 'package:arator/app.dart';
import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/bloc/bluetooth_device_bloc.dart';
import 'package:arator/pages/buy/finding_device.dart';
import 'package:arator/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business/bloc/authentication_bloc.dart';
import 'business/bloc/product_bloc.dart';
import 'business/bloc/user_bloc.dart';

void main() => runApp(Arator());

class Arator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc()),
        BlocProvider<UserBloc>(create: (context) => UserBloc()),
        BlocProvider<BuyerProductBloc>(create: (context) => BuyerProductBloc()),
        BlocProvider<SellerProductBloc>(
            create: (context) => SellerProductBloc()),
        BlocProvider<UserSettingsBloc>(
          create: (context) => UserSettingsBloc(),
        ),
        BlocProvider<LocationBloc>(
          create: (context) => LocationBloc(),
        ),
        BlocProvider<ShoppingCartBloc>(
          create: (context) => ShoppingCartBloc(),
        ),
        BlocProvider<BluetoothDeviceBloc>(
          create: (context) => BluetoothDeviceBloc(),
        ),
        BlocProvider<RouteTripBloc>(
          create: (context) => RouteTripBloc(),
        ),
        BlocProvider<BmiBloc>(
          create: (context) => BmiBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Arator',
        theme: AratorTheme.theme,
        home: App(),
      ),
    );
  }
}
