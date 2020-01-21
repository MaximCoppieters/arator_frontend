import 'package:equatable/equatable.dart';

abstract class BluetoothDeviceEvent extends Equatable {
  const BluetoothDeviceEvent();
}

class ConnectDevice extends BluetoothDeviceEvent {
  @override
  List<Object> get props => null;
}
