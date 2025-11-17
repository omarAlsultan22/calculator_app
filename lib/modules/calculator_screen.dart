import 'package:calculator/models/operators_model.dart';
import 'package:calculator/shared/cubit/cubit.dart';
import 'package:calculator/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'operators_states.dart';
import 'processes_states.dart';
import 'package:flutter/material.dart';


class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  static const Color _textColor = Colors.white;
  static const double _buttonFontSize = 25.0;
  static const double _displayFontSize = 50.0;


  void _statesListener(CalculatorStates state) {
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
    operators.operator(context);
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
          fontSize: _buttonFontSize,
          color: _textColor,
        ),
      ),
    );
  }


  Widget _buildDisplay(SuccessState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          state.value ?? '0',
          style: const TextStyle(
            fontSize: _displayFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }


  Widget _buildButtonRow(List<Operators> operators, List<Color> colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < operators.length; i++)
          _calculatorButton(operators[i], context, colors[i]),
      ],
    );
  }


  Widget _buildCalculatorBody(SuccessState state) {
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
          _buildDisplay(state),
          const SizedBox(height: 60.0),
          _buildButtonRow([
            Clear(value: 'C'),
            Parentheses(value: '()'),
            Mod(value: '%'),
            Divide(value: '/'),
          ], [
            Colors.red.shade700,
            Colors.blue.shade900,
            Colors.blue.shade900,
            Colors.blue.shade900,
          ]),
          const SizedBox(height: 10),
          _buildButtonRow([
            const Number(value: '7'),
            const Number(value: '8'),
            const Number(value: '9'),
            Multiplication(value: 'x'),
          ], [
            Colors.amber,
            Colors.amber,
            Colors.amber,
            Colors.blue.shade900,
          ]),
          const SizedBox(height: 10),
          _buildButtonRow([
            const Number(value: '4'),
            const Number(value: '5'),
            const Number(value: '6'),
            Munse(value: '-'),
          ], [
            Colors.amber,
            Colors.amber,
            Colors.amber,
            Colors.blue.shade900,
          ]),
          const SizedBox(height: 10),
          _buildButtonRow([
            const Number(value: '1'),
            const Number(value: '2'),
            const Number(value: '3'),
            Addition(value: '+'),
          ], [
            Colors.amber,
            Colors.amber,
            Colors.amber,
            Colors.blue.shade900,
          ]),
          const SizedBox(height: 10),
          _buildButtonRow([
            PlusMunsSign(value: '+/-'),
            const Number(value: '0'),
            const Number(value: '.'),
            Equal(value: '='),
          ], [
            Colors.grey,
            Colors.amber,
            Colors.grey,
            Colors.green.shade700,
          ]),
          const SizedBox(height: 10),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorCubit, CalculatorStates>(
      listener: (context, state) => _statesListener(state),
      builder: (context, state) {
        return Scaffold(
          body: _buildCalculatorBody(state as SuccessState),
        );
      },
    );
  }
}