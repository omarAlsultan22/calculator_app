import '../../models/calculator_model.dart';
import '../base/operators_model.dart';


class Clear extends Operators {

  @override
  String operator(CalculatorModel calculatorModel) {
      calculatorModel.clear();
      return '0';
  }
}


class Equal extends Operators {

  @override
  String operator(CalculatorModel calculatorModel) {

    final n1 = calculatorModel.n1;
    final n2 = calculatorModel.n2;
    final processes = calculatorModel.processes;

    try {
      final finalResult = processes!.process(n1!, n2!);
      calculatorModel.copyWith(finalResult: finalResult);
      return finalResult;
    }
    catch (error) {
      throw('It cannot be divided by zero');
    }
  }
}


class Parentheses extends Operators {

  @override
  String operator(CalculatorModel calculatorModel) {

    final result = calculatorModel.finalResult;
    var finalResult = result!;
    final isParenthesisOpen = calculatorModel.isParenthesisOpen;

    if (isParenthesisOpen!) {
      finalResult += ')';
      calculatorModel.copyWith(
          isParenthesisOpen: false, finalResult: finalResult);
      return finalResult;
    } else {
      finalResult += '(';
      calculatorModel.copyWith(
          isParenthesisOpen: true, finalResult: finalResult);
      return finalResult;
    }
  }
}


class PlusMunsSign extends Operators {

  @override
  String operator(CalculatorModel calculatorModel) {
    var isNegative = calculatorModel.isNegative!;
    var finalResult = calculatorModel.finalResult!;

    if (finalResult != '0') {
      isNegative = !isNegative;
      if (isNegative) {
        finalResult = '-$finalResult';
        calculatorModel.copyWith(
            isNegative: isNegative, finalResult: finalResult);
        return finalResult;
      } else {
        if (finalResult.startsWith('-')) {
          finalResult = finalResult.substring(1);
          calculatorModel.copyWith(
              isNegative: isNegative, finalResult: finalResult);
          return finalResult;
        }
      }
    }
    return finalResult;
  }
}

class Operator extends Operators {
  Operator({super.process});

  @override
  String operator(CalculatorModel calculatorModel) {
    final n1 = calculatorModel.n1!;
    final finalResult = calculatorModel.finalResult!;

    if (n1 != 0.0) {
      calculatorModel.copyWith(processesModel: process, result: '');
    }
    return finalResult;
  }
}

class Number extends Operators {
  const Number({super.value});

  @override
  String operator(CalculatorModel calculatorModel) {
    var n1 = calculatorModel.n1;
    var n2 = calculatorModel.n2;
    var result = calculatorModel.result!;

    result += value!;
    final finalResult = result;

    n1 == 0 ? n1 = double.parse(result) : n2 = double.parse(result);
    calculatorModel.copyWith(
        n1: n1, n2: n2, result: result, finalResult: finalResult);
    return finalResult;
  }
}
