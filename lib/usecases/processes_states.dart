import 'package:calculator/models/processes_model.dart';
import 'package:calculator/shared/cubit/cubit.dart';
import '../models/operators_model.dart';
import 'package:flutter/material.dart';


class Multiplication extends Operators implements Processes{
  Multiplication({super.value});

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getProcessOperator(Multiplication());
  }

  @override
  String process(double n1, double n2) {
    final result = (n1 * n2).toString();
    return doesDecimalContain(result);
  }
}


class Division extends Operators implements Processes{
  Division({super.value});

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getProcessOperator(Division());
  }

  @override
  String process(double n1, double n2) {
    if(n2 == 0){
      Exception('Cannot divide by zero');
    }
    final result =  (n1 / n2).toString();
    return doesDecimalContain(result);
  }
}


class Subtraction extends Operators implements Processes{
  Subtraction({super.value});

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getProcessOperator(Subtraction());
  }

  @override
  String process(double n1, double n2) {
    final result =  (n1 - n2).toString();
    return doesDecimalContain(result);
  }
}


class Addition extends Operators implements Processes{
  Addition({super.value});
  @override
  String process(double n1, double n2) {
    final result = (n1 + n2).toString();
    return doesDecimalContain(result);
  }

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getProcessOperator(Addition());
  }
}


class Modulus extends Operators implements Processes{
  Modulus({super.value});

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getProcessOperator(Modulus());
  }

  @override
  String process(double n1, double n2) {
    final result = (n1 % n2).toString();
    return doesDecimalContain(result);
  }
}


String doesDecimalContain(dynamic result) {
  if(result.toString().contains('.')) {
    List<String> splitDecimal = result.toString().split('.');
    if(!(int.parse(splitDecimal[1]) > 0)) {
      return result = splitDecimal[0].toString();
    }
  }
  return result;
}
