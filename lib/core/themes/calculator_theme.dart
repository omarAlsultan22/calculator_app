import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../../domain/usecases/base/operators_model.dart';
import '../../domain/usecases/states/operators_states.dart';


class CalculatorTheme {
  static Color getButtonColor(Operators operator) {
    switch (operator.runtimeType) {
      case Clear: return const Color(0xFFD32F2F);
      case Equal: return const Color(0xFF388E3C);
      case Operator: return const Color(0xFF0D47A1);
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