import '../base/operators_model.dart';
import '../../../data/models/calculator_model.dart';
import 'package:calculator/core/constants/app_constants.dart';


class Clear extends Operators {
  const Clear();

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    return calculatorModel.clear();
  }
}


class Equal extends Operators {
  const Equal();

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    final n1 = calculatorModel.n1;
    final n2 = calculatorModel.n2;
    final processes = calculatorModel.processes;

    if (n1 == null || n2 == null || processes == null) {
      return calculatorModel;
    }
    try {
      final finalResult = processes.process(n1, n2);
      return calculatorModel.copyWith(finalResult: finalResult);
    }
    catch (e) {
      rethrow;
    }
  }
}


class Parentheses extends Operators {
  const Parentheses();

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    final isParenthesisOpen = calculatorModel.isParenthesisOpen;
    final result = calculatorModel.finalResult;
    var finalResult = result!;

    if (isParenthesisOpen!) {
      finalResult += ')';
      return calculatorModel.copyWith(
          isParenthesisOpen: false, finalResult: finalResult);
    } else {
      finalResult += '(';
      return calculatorModel.copyWith(
          isParenthesisOpen: true, finalResult: finalResult);
    }
  }
}


class PlusMunsSign extends Operators {
  const PlusMunsSign();

  static const dash = '-';

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    var isNegative = calculatorModel.isNegative!;
    var finalResult = calculatorModel.finalResult!;

    if (finalResult != AppConstants.zero) {
      isNegative = !isNegative;
      if (isNegative) {
        finalResult = '$dash$finalResult';
        return calculatorModel.copyWith(
            isNegative: isNegative, finalResult: finalResult);
      } else {
        if (finalResult.startsWith(dash)) {
          finalResult = finalResult.substring(1);
          return calculatorModel.copyWith(
              isNegative: isNegative, finalResult: finalResult);
        }
      }
    }
    return calculatorModel;
  }
}


class Operator extends Operators {
  const Operator({super.process});

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    final n1 = calculatorModel.n1!;

    if (n1 != 0) {
      return calculatorModel.copyWith(processes: process, result: AppConstants.empty);
    }
    return calculatorModel;
  }
}


class Number extends Operators {
  const Number({super.value});

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    var n1 = calculatorModel.n1;
    var n2 = calculatorModel.n2;
    var result = calculatorModel.result!;

    result += value!;
    final finalResult = result;

    n1 == 0 ? n1 = double.parse(result) : n2 = double.parse(result);
    return calculatorModel.copyWith(
        n1: n1, n2: n2, result: result, finalResult: finalResult);
  }
}
