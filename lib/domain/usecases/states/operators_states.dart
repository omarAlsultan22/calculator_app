import '../base/operators_model.dart';
import '../../../data/models/calculator_model.dart';


class Clear extends Operators {

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
      return calculatorModel.clear();
  }
}


class Equal extends Operators {

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {

    final n1 = calculatorModel.n1;
    final n2 = calculatorModel.n2;
    final processes = calculatorModel.processes;

    if (n1 == null || n2 == null || processes == null) {
      return calculatorModel;
    }
     final finalResult = processes.process(n1, n2);
      return calculatorModel.copyWith(finalResult: finalResult);
  }
}


class Parentheses extends Operators {

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    final result = calculatorModel.finalResult;
    var finalResult = result!;
    final isParenthesisOpen = calculatorModel.isParenthesisOpen;

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

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    var isNegative = calculatorModel.isNegative!;
    var finalResult = calculatorModel.finalResult!;

    if (finalResult != '0') {
      isNegative = !isNegative;
      if (isNegative) {
        finalResult = '-$finalResult';
        return calculatorModel.copyWith(
            isNegative: isNegative, finalResult: finalResult);
      } else {
        if (finalResult.startsWith('-')) {
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
  Operator({super.process});

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    final n1 = calculatorModel.n1!;

    if (n1 != 0.0) {
      return calculatorModel.copyWith(processesModel: process, result: '');
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
