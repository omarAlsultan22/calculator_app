import 'package:calculator/themes/calculator_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../usecases/base/operators_model.dart';
import '../layouts/calculator_layout.dart';
import '../constants/app_constants.dart';
import 'package:flutter/material.dart';
import '../shared/states/states.dart';
import '../shared/cubit/cubit.dart';


class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorCubit, CalculatorStates>(
      listener: (context, state) => _statesListener(context, state),
      builder: (context, state) {
        return Scaffold(
          body: CalculatorLayout(
            displayValue: (state is SuccessState)? state.value! : '0',
            onOperatorPressed: (op) => _onOperatorPressed(op, context),
            buttonBuilder: (context, operator) =>
                _calculatorButton(
                  operator,
                  context,
                  CalculatorTheme.getButtonColor(operator),
                ),
          ),
        );
      },
    );
  }


  void _statesListener(BuildContext context, CalculatorStates state) {
    if (state is ErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.value!),
          backgroundColor: Colors.red.shade700,
        ),
      );
    }
  }


  void _onOperatorPressed(Operators operators, BuildContext context) {
    final cubit = CalculatorCubit.get(context);
    cubit.getButtonResult(operators);
  }


  Widget _calculatorButton(Operators operators,
      BuildContext context,
      Color backgroundColor,) {
    return MaterialButton(
      onPressed: () => _onOperatorPressed(operators, context),
      color: backgroundColor,
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(20),
      child: Text(
        operators.value!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppConstants.buttonFontSize,
          color: AppConstants.textColor,
        ),
      ),
    );
  }
}