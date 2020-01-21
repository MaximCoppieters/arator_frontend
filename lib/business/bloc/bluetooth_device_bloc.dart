import 'dart:async';
import 'package:arator/business/bloc/bluetooth_device_event.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'bluetooth_device_state.dart';

class BluetoothDeviceBloc
    extends Bloc<BluetoothDeviceEvent, BluetoothDeviceConnectionState> {
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  BluetoothDevice _device;

  @override
  BluetoothDeviceConnectionState get initialState =>
      InitialBluetoothDeviceState();

  @override
  Stream<BluetoothDeviceConnectionState> mapEventToState(
    BluetoothDeviceEvent event,
  ) async* {
    if (event is ConnectDevice) {
      yield* _mapConnectDevice();
    }
  }

  Stream<BluetoothDeviceConnectionState> _mapConnectDevice() async* {
    yield Connecting();

    List<BluetoothDevice> connectedDevices =
        await _flutterBlue.connectedDevices;

    if (connectedDevices.isNotEmpty) {
      _device = connectedDevices.first;
      print("Find from connected");
      await _device.disconnect();
      await _device.connect();
      yield Connected(_device);
      return;
    }

    Completer completer = Completer();
    try {
      StreamSubscription subscription;

      subscription = _flutterBlue.scan().listen((scanResult) async {
        if (scanResult.device.id.id == "F0:13:C3:B1:2A:BF") {
          print("connecting");
          await scanResult.device.connect();
          print("connected");
          _device = scanResult.device;
          subscription.cancel();
          completer.complete(Connected(_device));
        }
      });
    } catch (error) {
      print(error);
      yield ConnectionFailed(error);
      completer.complete(ConnectionFailed);
    }
    await completer.future;
  }
}
