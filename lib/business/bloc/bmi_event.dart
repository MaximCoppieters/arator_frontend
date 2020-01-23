import 'package:equatable/equatable.dart';

abstract class BmiEvent extends Equatable {
  const BmiEvent();
}

class Calculate extends BmiEvent {
  final num height;
  final num weight;
  Calculate(this.height, this.weight);
  @override
  List<Object> get props => [height, weight];
}
