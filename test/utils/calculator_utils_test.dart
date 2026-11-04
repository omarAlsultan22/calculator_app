import '../fixtures/calculator_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/utils/calculator_utils.dart';
import 'package:calculator/domain/use_cases/states/processes_states.dart';


void main() {
  group('getResult', () {
    test('returns calculate result when numbers is empty', () {
      final model = modelWith(
        n1: 5,
        n2: 3,
        process: const Addition(),
      );

      final result = CalculatorUtils.getResult(model);

      // 5 + 3 = 8
      expect(result, 8);
    });

    test('applies one process from numbers/processes lists', () {
      final model = modelWith(
        n1: 5,
        n2: 3,
        process: const Addition(),
        numbers: [5.0],
        processes: [const Addition()],
      );

      // الأول: 5 + 3 = 8
      // ثم: currentNumber (5) + result (8) = 13
      final result = CalculatorUtils.getResult(model);

      expect(result, 13);
    });

    test('applies multiple processes in order', () {
      final model = modelWith(
        n1: 10,
        n2: 2,
        process: const Subtraction(),
        numbers: [10.0, 2.0],
        processes: [const Subtraction(), const Addition()],
      );

      // الأول: 10 - 2 = 8
      // ثم: currentNumber (10) - 8 = 2
      // ثم: currentNumber (2) + 2 = 4
      final result = CalculatorUtils.getResult(model);

      expect(result, 4);
    });

    test('applies Multiplication correctly', () {
      final model = modelWith(
        n1: 3,
        n2: 4,
        process: const Multiplication(),
        numbers: [3.0],
        processes: [const Multiplication()],
      );

      // 3 * 4 = 12
      // ثم: 3 * 12 = 36
      final result = CalculatorUtils.getResult(model);

      expect(result, 36);
    });

    test('applies Division correctly', () {
      final model = modelWith(
        n1: 10,
        n2: 2,
        process: const Division(),
        numbers: [10.0],
        processes: [const Division()],
      );

      // 10 / 2 = 5
      // ثم: 10 / 5 = 2
      final result = CalculatorUtils.getResult(model);

      expect(result, 2);
    });

    test('propagates division by zero error', () {
      final model = modelWith(
        n1: 10,
        n2: 0,
        process: const Division(),
      );

      expect(
            () => CalculatorUtils.getResult(model),
        throwsA(isA<FormatException>()),
      );
    });

    test('stops at the shorter list (numbers vs processes)', () {
      final model = modelWith(
        n1: 5,
        n2: 3,
        process: const Addition(),
        numbers: [5.0, 2.0],  // 2 عناصر
        processes: [const Addition()],  // عنصر واحد
      );

      // الأول: 5 + 3 = 8
      // ثم: currentNumber (5) + 8 = 13
      // لا index = 1 (لأن processesListLength = 1)
      final result = CalculatorUtils.getResult(model);

      expect(result, 13);
    });
  });
}