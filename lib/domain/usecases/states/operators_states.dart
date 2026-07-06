import '../base/operators_model.dart';
import '../../../constants/app_strings.dart';
import '../../../data/models/calculator_model.dart';
import 'package:calculator/utils/calculator_utils.dart';


class Clear extends Operators {
  const Clear({required super.value});

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    return calculatorModel.clear();
  }
}


class Equal extends Operators {
  const Equal({required super.value});

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    final n1 = calculatorModel.n1;
    final n2 = calculatorModel.n2;

    if (n1 == null || n2 == null || calculatorModel.process == null) {
      return calculatorModel;
    }
    final finalResult = CalculatorUtils.getResult(calculatorModel);
    try {
      return calculatorModel.copyWith(
        n1: finalResult,
        n2: null,
        process: null,
        result: AppStrings.empty,
        numbers: const [],
        processes: const [],
        parentheses: const [],
        finalResult: finalResult.toString(),
      );
    }
    catch (e) {
      rethrow;
    }
  }
}


class Parentheses extends Operators {
  const Parentheses({required super.value});

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    final n1 = calculatorModel.n1;
    final n2 = calculatorModel.n2;
    final process = calculatorModel.process;
    var result = calculatorModel.result;

    try {
      if (!calculatorModel.parenthesesListIsEmpty &&
          calculatorModel.currentArc != calculatorModel.parenthesesListLength &&
          n2 != null ||
          !calculatorModel.parenthesesListIsEmpty &&
              calculatorModel.currentArc !=
                  calculatorModel.parenthesesListLength && n1 != null &&
              n2 == null && process == null) {
        result += ')';
      }
      else {
        const value = '(';
        result.isEmpty ? result = value : result += value;
        final numbers = n1 != null
            ? [...calculatorModel.numbers, n1]
            : calculatorModel.numbers;
        final processes = process != null ? [
          ...calculatorModel.processes,
          process
        ] : calculatorModel.processes;
        return calculatorModel.copyWith(
            n1: null,
            n2: null,
            process: null,
            result: result,
            finalResult: result,
            numbers: numbers,
            processes: processes,
            parentheses: [...calculatorModel.parentheses, value]
        );
      }
      return calculatorModel.copyWith(
        result: result,
        finalResult: result,
        n1: calculatorModel.n1,
        n2: calculatorModel.n2,
        process: calculatorModel.process,
        currentArc: calculatorModel.currentArc + 1,
      );
    }
    catch (e) {
      rethrow;
    }
  }
}


class PlusMunsSign extends Operators {
  const PlusMunsSign({required super.value});

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    var result = calculatorModel.result;
    var finalResult = calculatorModel.finalResult;
    var isNegative = calculatorModel.isNegative;

    // ✅ حالة 1: التعبير فارغ
    if (result.isEmpty || result == '0') {
      return calculatorModel;
    }
    // ✅ حالة 2: التعامل مع تغيير إشارة الرقم الحالي
    // التحقق مما إذا كنا في بداية إدخال رقم جديد
    if (calculatorModel.process == null || calculatorModel.processes.isEmpty) {
      // تغيير إشارة n1
      if (result.startsWith('-')) {
        result = result.substring(1);
        finalResult = finalResult.startsWith('-')
            ? finalResult.substring(1)
            : finalResult;
      } else {
        result = '-$result';
        finalResult = finalResult.startsWith('-')
            ? finalResult.substring(1)
            : '-$finalResult';
      }

      return calculatorModel.copyWith(
        isNegative: !isNegative,
        result: result,
        finalResult: finalResult,
        n1: double.tryParse(result),
      );
    }

    // ✅ حالة 3: التعامل مع n2 (عند وجود عملية)
    else {
      // إذا كان n2 موجوداً
      if (calculatorModel.n2 != null) {
        var n2 = calculatorModel.n2!;
        // تغيير إشارة n2
        if (result.startsWith('-')) {
          result = result.substring(1);
          n2 = n2.abs();
        } else {
          result = '-$result';
          n2 = -n2.abs();
        }

        return calculatorModel.copyWith(
          isNegative: !isNegative,
          result: result,
          finalResult: result,
          n2: n2,
        );
      }

      // ✅ حالة 4: إضافة علامة سالبة للرقم الجديد
      else {
        // إذا كان آخر حرف هو عملية، نضيف سالب للرقم القادم
        if (result.isNotEmpty && '+-×÷'.contains(result[result.length - 1])) {
          result += '-';
          finalResult += '-';

          return calculatorModel.copyWith(
            isNegative: true,
            result: result,
            finalResult: finalResult,
          );
        }

        // تغيير إشارة الرقم الحالي
        if (result.startsWith('-')) {
          result = result.substring(1);
          finalResult = finalResult.startsWith('-')
              ? finalResult.substring(1)
              : finalResult;
        } else {
          result = '-$result';
          finalResult = finalResult.startsWith('-')
              ? finalResult.substring(1)
              : '-$finalResult';
        }

        return calculatorModel.copyWith(
          isNegative: !isNegative,
          result: result,
          finalResult: finalResult,
          n2: double.tryParse(result),
        );
      }
    }
  }
}


class Operator extends Operators {
  const Operator({
    required super.value,
    required super.process,
  });

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    try {
      if (calculatorModel.n1 != null &&
          calculatorModel.n2 != null &&
          calculatorModel.process != null) {
        final result = CalculatorUtils.getResult(calculatorModel);

        if (value == 'x' || value == '/' || value == '%') {
          if (calculatorModel.process != process) {
            return calculatorModel.copyWith(
                n1: calculatorModel.n2!,
                n2: null,
                process: process,
                result: AppStrings.empty,
                finalResult: result.toString(),
                numbers: [
                  ...calculatorModel.numbers,
                  calculatorModel.n1!
                ],
                processes: [
                  ...calculatorModel.processes,
                  calculatorModel.process!
                ]
            );
          }
        }
        return calculatorModel.copyWith(
          n1: result,
          n2: null,
          process: process,
          result: AppStrings.empty,
          finalResult: result.toString(),
        );
      }
      return calculatorModel.copyWith(
          n1: calculatorModel.n1,
          n2: calculatorModel.n2,
          process: process,
          result: AppStrings.empty
      );
    }
    catch (e) {
      rethrow;
    }
  }
}


class Number extends Operators {
  const Number({required super.value});

  static const int maxDigits = 20;

  @override
  CalculatorModel operator(CalculatorModel calculatorModel) {
    var n1 = calculatorModel.n1;
    var n2 = calculatorModel.n2;
    var result = calculatorModel.result;

    try {
      if (value == AppStrings.decimal && result.contains(AppStrings.decimal)) {
        return calculatorModel;
      }

      String cleanResult = result.replaceAll(
          AppStrings.decimal, AppStrings.empty).replaceAll(
          '-', AppStrings.empty);
      if (cleanResult.length >= maxDigits && value != AppStrings.decimal) {
        return calculatorModel;
      }
      if (value == AppStrings.zero && result == AppStrings.zero) {
        return calculatorModel;
      }
      if (value == '.' && result.isEmpty) {
        result = AppStrings.zero;
      }

      result += value;
      final cleaned = result.replaceAll(RegExp(r'[()\s]'), AppStrings.empty);

      if (calculatorModel.process == null) {
        if (!result.endsWith(AppStrings.decimal)) {
          n1 = double.tryParse(cleaned) ?? 0.0;
        }
      } else {
        if (!result.endsWith(AppStrings.decimal)) {
          n2 = double.tryParse(cleaned) ?? 0.0;
        }
      }

      return calculatorModel.copyWith(
          n1: n1,
          n2: n2,
          process: calculatorModel.process,
          result: result,
          finalResult: result
      );
    }
    catch (e) {
      rethrow;
    }
  }
}