import 'package:equatable/equatable.dart';

abstract class BmiState extends Equatable {
  const BmiState();
}

class InitialBmiState extends BmiState {
  @override
  List<Object> get props => [];
}

class Calculated extends BmiState {
  final String bmi;
  Calculated(this.bmi);
  @override
  List<Object> get props => [bmi];
}
