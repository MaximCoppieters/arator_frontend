import 'dart:async';

import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/bloc/bluetooth_device_bloc.dart';
import 'package:arator/business/bloc/bluetooth_device_event.dart';
import 'package:arator/business/bloc/bluetooth_device_state.dart';
import 'package:arator/components/elements/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';

class FindingDevicePage extends StatefulWidget {
  @override
  _FindingDevicePageState createState() => _FindingDevicePageState();
}

class _FindingDevicePageState extends State<FindingDevicePage> {
  BluetoothDeviceBloc _bluetoothDeviceBloc;

  @override
  void initState() {
    _bluetoothDeviceBloc = BlocProvider.of<BluetoothDeviceBloc>(context);
    _bluetoothDeviceBloc.listen((state) {
      if (state is Connected) {
        BluetoothDevice dev = state.props[0];

        dev.discoverServices();
        readHeartRate(dev);
      }
    });
    super.initState();
  }

  readHeartRate(BluetoothDevice dev) async {
    Timer.periodic(Duration(seconds: 4), (timer) {
      dev.services.listen((services) async {
        // var heartRateService = services.firstWhere((service) =>
        //     service.uuid.toString() ==
        //     "0000180d-0000-1000-8000-00805f9b34fb");
        Stopwatch stopwatch = Stopwatch();
        for (BluetoothService service in services) {
          if (service != null &&
              service.uuid
                  .toString()
                  .startsWith("45121540-51f2-406e-927a-3e1e183412e0")) {
            for (BluetoothCharacteristic characteristic
                in service.characteristics) {
              try {
                if (!stopwatch.isRunning) {
                  stopwatch.start();
                }
                if (!characteristic.isNotifying) {
                  await characteristic.setNotifyValue(true);
                  characteristic.value.listen((readValue) {
                    print(readValue);
                  });
                }
              } catch (error) {}
            }
          }
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Connected Devices"),
        ),
        body: BlocBuilder<BluetoothDeviceBloc, BluetoothDeviceConnectionState>(
            bloc: _bluetoothDeviceBloc,
            builder: (context, state) {
              var trailing;
              if (state is Connected) {
                trailing = Text("Connected");
              } else if (state is InitialBluetoothDeviceState) {
                trailing = AppButton(
                  child: Text("Connect"),
                  onPressed: () {
                    _bluetoothDeviceBloc.add(ConnectDevice());
                  },
                );
              } else {
                trailing = CircularProgressIndicator();
              }
              return ListView(
                children: <Widget>[
                  Card(
                    child: ListTile(
                        leading: Image.asset("assets/images/tickr_fit.jpg"),
                        title: Text("TICKR FIT"),
                        trailing: trailing),
                  ),
                ],
              );
            }));
  }
}
