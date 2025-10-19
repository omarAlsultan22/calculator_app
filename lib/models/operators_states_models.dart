import 'package:flutter/cupertino.dart';
import '../shared/cubit/cubit.dart';
import 'operators_model.dart';

class Clear extends Operators {
  Clear({super.value});

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).clear();
  }
}

class Equal extends Operators {
  Equal({super.value});

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getFinalResult();
  }
}

class Parentheses extends Operators {
  Parentheses({super.value});

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getParentheses();
  }
}

class PlusMunsSign extends Operators {
  PlusMunsSign({super.value});

  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getPlusMunsSign();
  }
}

class Number extends Operators {
  const Number({super.value});
  @override
  void operator(BuildContext context) {
    CalculatorCubit.get(context).getOperator(value!);
  }
}