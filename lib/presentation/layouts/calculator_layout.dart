import 'package:flutter/material.dart';
import '../../themes/calculator_theme.dart';
import '../../domain/usecases/base/operators_model.dart';
import '../../domain/usecases/states/operators_states.dart';
import '../../domain/usecases/states/processes_states.dart';
import 'package:calculator/data/models/calculator_model.dart';


class CalculatorLayout extends StatelessWidget {
  final CalculatorModel calculatorModel;
  final Widget Function(BuildContext, Operators) buttonBuilder;

  const CalculatorLayout({
    Key? key,
    required this.buttonBuilder,
    required this.calculatorModel,
  }) : super(key: key);

  static const _sizedBox = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF303030),
            Color(0xFF212121),
            Colors.black,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildDisplay(),
            const SizedBox(height: 60.0),
            _buildButtonRows(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      child: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text(
            calculatorModel.finalResult,
            style: CalculatorTheme.displayStyle,
            softWrap: true, // ✅ يسمح بالتفاف النص
            overflow: TextOverflow.visible,
            maxLines: null,
          )
      ),
    );
  }

  Widget _buildButtonRows(BuildContext context) {
    return Column(
      children: [
        _buildButtonRow(
            context,
            [
              const Clear(value: 'C'),
              const Parentheses(value: '( )'),
              const Operator(process: Modulus(), value: '%'),
              const Operator(process: Division(), value: '/'),
            ]
        ),
        _sizedBox,
        _buildButtonRow(
            context,
            [
              const Number(value: '7'),
              const Number(value: '8'),
              const Number(value: '9'),
              const Operator(process: Multiplication(), value: 'x'),
            ]
        ),
        _sizedBox,
        _buildButtonRow(
            context,
            [
              const Number(value: '4'),
              const Number(value: '5'),
              const Number(value: '6'),
              const Operator(process: Subtraction(), value: '-'),
            ]
        ),
        _sizedBox,
        _buildButtonRow(
          context,
          [
            const Number(value: '1'),
            const Number(value: '2'),
            const Number(value: '3'),
            const Operator(process: Addition(), value: '+'),
          ],
        ),
        _sizedBox,
        _buildButtonRow(
            context,
            [
              const PlusMunsSign(value: '+/-'),
              const Number(value: '0'),
              const Number(value: '.'),
              const Equal(value: '='),
            ]
        ),
        _sizedBox,
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