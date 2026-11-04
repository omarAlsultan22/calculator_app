import '../../fakes/fake_process.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/domain/use_cases/calculator_service.dart';
import 'package:calculator/domain/use_cases/base/processes_model.dart';
import 'package:calculator/domain/use_cases/states/processes_states.dart';


void main() {
  group('calculate', () {
    test('calls process.process with n1 and n2', () {
      final process = FakeProcess(result: 10);

      final result = CalculatorService.calculate(
        process: process,
        n1: 5,
        n2: 2,
      );

      expect(result, 10);
    });

    test('throws when process is null', () {
      expect(
            () => CalculatorService.calculate(
          process: null,
          n1: 5,
          n2: 2,
        ),
        throwsA(isA<Exception>().having(
              (e) => e.toString(),
          'message',
          contains('Process is not set'),
        )),
      );
    });

    test('throws TypeError when n1 is null', () {
      final process = FakeProcess(result: 10);

      expect(
            () => CalculatorService.calculate(
          process: process,
          n1: null,
          n2: 2,
        ),
        throwsA(isA<TypeError>()),
      );
    });

    test('throws TypeError when n2 is null', () {
      final process = FakeProcess(result: 10);

      expect(
            () => CalculatorService.calculate(
          process: process,
          n1: 5,
          n2: null,
        ),
        throwsA(isA<TypeError>()),
      );
    });

    test('propagates errors from process.process', () {
      final process = FakeProcess(
        result: 0,
        error: const FormatException('custom error'),
      );

      expect(
            () => CalculatorService.calculate(
          process: process,
          n1: 5,
          n2: 2,
        ),
        throwsA(isA<FormatException>()),
      );
    });

    test('works with real Addition', () {
      final result = CalculatorService.calculate(
        process: const Addition(),
        n1: 5,
        n2: 3,
      );

      expect(result, 8);
    });
  });

  group('getReversedNumbers', () {
    test('reverses a list of numbers', () {
      final result = CalculatorService.getReversedNumbers([1.0, 2.0, 3.0]);

      expect(result, [3.0, 2.0, 1.0]);
    });

    test('returns empty list for empty input', () {
      final result = CalculatorService.getReversedNumbers(<double>[]);

      expect(result, isEmpty);
    });

    test('returns same single element', () {
      final result = CalculatorService.getReversedNumbers([5.0]);

      expect(result, [5.0]);
    });

    test('does not modify original list', () {
      final original = <double>[1.0, 2.0, 3.0];
      CalculatorService.getReversedNumbers(original);

      expect(original, [1.0, 2.0, 3.0]);
    });
  });

  group('getReversedProcesses', () {
    test('reverses a list of processes', () {
      final result = CalculatorService.getReversedProcesses([
        const Addition(),
        const Subtraction(),
      ]);

      expect(result.length, 2);
      expect(result[0], isA<Subtraction>());
      expect(result[1], isA<Addition>());
    });

    test('returns empty list for empty input', () {
      final result = CalculatorService.getReversedProcesses(<Processes>[]);

      expect(result, isEmpty);
    });

    test('does not modify original list', () {
      final original = <Processes>[const Addition(), const Subtraction()];
      CalculatorService.getReversedProcesses(original);

      expect(original.length, 2);
      expect(original[0], isA<Addition>());
      expect(original[1], isA<Subtraction>());
    });
  });
}