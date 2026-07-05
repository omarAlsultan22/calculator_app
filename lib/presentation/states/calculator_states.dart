import 'package:calculator/data/models/calculator_model.dart';


abstract class CalculatorStates {
  final CalculatorModel calculatorModel;

  const CalculatorStates({required this.calculatorModel});
}

class InitialState extends CalculatorStates {
  const InitialState({required super.calculatorModel});
}

class SuccessState extends CalculatorStates {
  const SuccessState({required super.calculatorModel});
}

class ErrorState extends CalculatorStates {
  final String message;

  const ErrorState({required this.message, required super.calculatorModel});
}