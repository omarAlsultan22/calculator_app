import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../usecases/base/operators_model.dart';
import '../usecases/states/operators_states.dart';
import '../usecases/states/processes_states.dart';


class CalculatorLayout extends StatelessWidget {
  final String displayValue;
  final Function(Operators) onOperatorPressed;
  final Widget Function(BuildContext, Operators) buttonBuilder;

  const CalculatorLayout({
    Key? key,
    required this.displayValue,
    required this.onOperatorPressed,
    required this.buttonBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey[850]!,
            Colors.grey[900]!,
            Colors.black,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildDisplay(),
          const SizedBox(height: 60.0),
          _buildButtonRows(context),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          displayValue,
          style: const TextStyle(
            fontSize: AppConstants.displayFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRows(BuildContext context) {
    return Column(
      children: [
        _buildButtonRow(
            context,
            [
              Clear(),
              Parentheses(),
              Operator(process: Modulus()),
              Operator(process: Division()),
            ]
        ),
        AppConstants.sizedBox,
        _buildButtonRow(
            context,
            [
              const Number(value: '7'),
              const Number(value: '8'),
              const Number(value: '9'),
              Operator(process: Multiplication()),
            ]
        ),
        AppConstants.sizedBox,
        _buildButtonRow(
            context,
            [
              const Number(value: '4'),
              const Number(value: '5'),
              const Number(value: '6'),
              Operator(process: Subtraction()),
            ]
        ),
        AppConstants.sizedBox,
        _buildButtonRow(
          context,
          [
            const Number(value: '1'),
            const Number(value: '2'),
            const Number(value: '3'),
            Operator(process: Addition()),
          ],
        ),
        AppConstants.sizedBox,
        _buildButtonRow(
            context,
            [
              PlusMunsSign(),
              const Number(value: '0'),
              const Number(value: '.'),
              Equal(),
            ]
        ),
        AppConstants.sizedBox,
      ],
    );
  }

  Widget _buildButtonRow(BuildContext context, List<Operators> operators) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: operators.map((op) => buttonBuilder(context, op)).toList()
    );
  }
}