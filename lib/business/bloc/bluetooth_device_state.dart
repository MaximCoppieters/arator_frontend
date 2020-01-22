import 'package:equatable/equatable.dart';
import 'package:flutter_blue/flutter_blue.dart';

abstract class BluetoothDeviceConnectionState extends Equatable {
  const BluetoothDeviceConnectionState();
}

class InitialBluetoothDeviceState extends BluetoothDeviceConnectionState {
  @override
  List<Object> get props => [];
}

class Connecting extends BluetoothDeviceConnectionState {
  @override
  List<Object> get props => null;
}

class ConnectionFailed extends BluetoothDeviceConnectionState {
  final Exception error;
  ConnectionFailed(this.error);
  @override
  List<Object> get props => [error];
}

class Connected extends BluetoothDeviceConnectionState {
  final BluetoothDevice device;

  Connected(this.device);

  @override
  List<Object> get props => [device];
}

class CheckingStatus extends Connected {
  CheckingStatus(BluetoothDevice device) : super(device);
}

class StatusFound extends Connected {
  bool measure;
  StatusFound(BluetoothDevice device, this.measure) : super(device);
}
