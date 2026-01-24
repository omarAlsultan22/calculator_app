import '../../../data/models/calculator_model.dart';
import 'package:calculator/domain/usecases/base/processes_model.dart';


abstract class Operators {
  final String? value;
  final Processes? process;

  const Operators({this.value, this.process});

  CalculatorModel operator(CalculatorModel calculatorModel);
}


