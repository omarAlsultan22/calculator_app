import '../../../data/models/calculator_model.dart';
import 'package:calculator/domain/use_cases/base/processes_model.dart';


abstract class Operators {
  final String value;
  final Processes? process;

  const Operators({required this.value, this.process});

  CalculatorModel operator(CalculatorModel calculatorModel);
}


