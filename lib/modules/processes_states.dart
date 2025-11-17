import 'package:calculator/models/processes_model.dart';
import 'package:calculator/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import '../models/operators_model.dart';


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


class Divide extends Operators implements Processes{
  Divide({super.value});

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getProcessOperator(Divide());
  }

  @override
  String process(double n1, double n2) {
    if(n2 == 0){
      Exception('Can not be divide on zero');
    }
    final result =  (n1 / n2).toString();
    return doesDecimalContain(result);
  }
}


class Munse extends Operators implements Processes{
  Munse({super.value});

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getProcessOperator(Munse());
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


class Mod extends Operators implements Processes{
  Mod({super.value});

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getProcessOperator(Mod());
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
