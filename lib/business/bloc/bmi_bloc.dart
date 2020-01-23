import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../calculator_BMI.dart';
import './bloc.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  @override
  BmiState get initialState => InitialBmiState();

  @override
  Stream<BmiState> mapEventToState(
    BmiEvent event,
  ) async* {
    if (event is Calculate) {
      num height = event.props[0];
      num weight = event.props[1];
      CalculatorBMI calc = CalculatorBMI(height: height, weight: weight);

      yield Calculated(calc.getBMI());
    }
  }
}
