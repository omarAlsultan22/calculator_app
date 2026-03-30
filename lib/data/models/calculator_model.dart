import 'package:calculator/core/constants/app_constants.dart';

import '../../domain/usecases/base/processes_model.dart';


class CalculatorModel {
  double? n1;
  double? n2;
  String? opr;
  String? result;
  String? finalResult;
  bool? isNegative;
  bool? isParenthesisOpen;
  Processes? processes;

  static const _zero = AppConstants.zero;

  CalculatorModel({
    this.n1 = 0.0,
    this.n2 = 0.0,
    this.opr = '',
    this.result = '',
    this.processes,
    this.finalResult = _zero,
    this.isNegative = false,
    this.isParenthesisOpen = false,
  });

  CalculatorModel copyWith({
    double? n1,
    double? n2,
    String? opr,
    String? result,
    String? finalResult,
    bool? isNegative,
    bool? isParenthesisOpen,
    Processes? processes,
  }) {
    return CalculatorModel(
        n1: n1 ?? this.n1,
        n2: n2 ?? this.n2,
        opr: opr ?? this.opr,
        result: result ?? this.result,
        finalResult: finalResult ?? this.finalResult,
        isNegative: isNegative ?? this.isNegative,
        processes: processes ?? this.processes,
        isParenthesisOpen: isParenthesisOpen ?? this.isParenthesisOpen
    );
  }

  CalculatorModel clear() {
    return CalculatorModel(
        n1: 0.0,
        n2: 0.0,
        opr: '',
        result: '',
        finalResult: _zero,
        isNegative: false,
        processes: null,
        isParenthesisOpen: false
    );
  }
}