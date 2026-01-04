import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../usecases/base/operators_model.dart';
import '../usecases/states/operators_states.dart';


class CalculatorTheme {
  static Color getButtonColor(Operators operator) {
    switch (operator.runtimeType) {
      case Clear: return Colors.red.shade700;
      case Equal: return Colors.green.shade700;
      case Operator: return Colors.blue.shade900;
      case Number: return Colors.amber;
      default: return Colors.grey;
    }
  }

  static const displayStyle = TextStyle(
    fontSize: AppConstants.displayFontSize,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const buttonStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: AppConstants.buttonFontSize,
    color: AppConstants.textColor,
  );
}