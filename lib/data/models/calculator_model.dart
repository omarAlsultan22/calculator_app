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

  //texts
  static const _empty = AppConstants.empty;

  //numbers
  static const _decimalNumber = 0.0;
  static const _correctNumber = AppConstants.zero;

  CalculatorModel({
    this.n1 = _decimalNumber,
    this.n2 = _decimalNumber,
    this.opr = AppConstants.empty,
    this.result = _empty,
    this.processes,
    String? finalResult = _correctNumber,
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
        n1: _decimalNumber,
        n2: _decimalNumber,
        opr: _empty,
        result: _empty,
        finalResult: _correctNumber,
        isNegative: false,
        processes: null,
        isParenthesisOpen: false
    );
  }
}