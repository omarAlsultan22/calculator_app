abstract class CalculatorStates{
  final String? value;
  const CalculatorStates({this.value});
}

class InitialState extends CalculatorStates {
  InitialState();
}

class SuccessState extends CalculatorStates{
  const SuccessState({super.value});
}

class ErrorState extends CalculatorStates{
  const ErrorState({super.value});
}