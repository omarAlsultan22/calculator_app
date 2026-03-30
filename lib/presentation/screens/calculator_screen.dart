import '../cubit/cubit.dart';
import '../states/states.dart';
import 'package:flutter/material.dart';
import '../layouts/calculator_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_constants.dart';
import '../../core/themes/calculator_theme.dart';
import '../../domain/usecases/base/operators_model.dart';


class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorCubit, CalculatorStates>(
      listener: (context, state) => _statesListener(context, state),
      builder: (context, state) {
        return Scaffold(
          body: CalculatorLayout(
            displayValue: (state is SuccessState) ? state.value! : AppConstants
                .zero,
            buttonBuilder: (context, operator) =>
                _calculatorButton(
                  operators: operator,
                  context: context,
                  backgroundColor: CalculatorTheme.getButtonColor(operator),
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

  Widget _calculatorButton({
    required Operators operators,
    required BuildContext context,
    required Color backgroundColor
  }) {
    return MaterialButton(
      onPressed: () => _onOperatorPressed(operators, context),
      color: backgroundColor,
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(20.0),
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