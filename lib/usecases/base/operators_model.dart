import 'package:calculator/models/calculator_model.dart';
import 'package:calculator/usecases/base/processes_model.dart';

abstract class Operators {
  final String? value;
  final Processes? process;

  const Operators({this.value, this.process});

  String operator(CalculatorModel calculatorModel);
}


