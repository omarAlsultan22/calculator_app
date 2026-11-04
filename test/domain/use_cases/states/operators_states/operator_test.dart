import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/calculator_models.dart';
import 'package:calculator/domain/use_cases/states/operators_states.dart';
import 'package:calculator/domain/use_cases/states/processes_states.dart';


void main() {
  group('Operator', () {
    test('sets process when n1 exists and n2 is null', () {
      final model = modelWith(n1: 5, result: '5', finalResult: '5');

      final result = const Operator(
        value: '+',
        process: Addition(),
      ).operator(model);

      expect(result.process, isA<Addition>());
      expect(result.n1, 5);
      expect(result.result, '');
    });

    test('computes result when n1, n2, process all exist', () {
      final model = modelWith(
        n1: 5,
        n2: 3,
        process: const Addition(),
        result: '5+3',
        finalResult: '5+3',
      );

      final result = const Operator(
        value: '=',
        process: Addition(),
      ).operator(model);

      expect(result.n1, 8);
      expect(result.n2, isNull);
    });

    test('handles priority operator (x) with different process', () {
      final model = modelWith(
        n1: 5,
        n2: 3,
        process: const Addition(),
        result: '5+3',
        finalResult: '5+3',
        numbers: [5.0],
        processes: [const Addition()],
      );

      final result = const Operator(
        value: 'x',
        process: Multiplication(),
      ).operator(model);

      // value == 'x' → priority operator
      // process != process (Addition != Multiplication) → push to lists
      expect(result.n1, 3);
      expect(result.n2, isNull);
      expect(result.process, isA<Multiplication>());
      expect(result.numbers, [5.0, 5.0]);
      expect(result.processes.length, 2);
    });

    test('returns copyWith when n1 is null', () {
      final model = modelWith(n2: 3, process: const Addition());

      final result = const Operator(
        value: '+',
        process: Addition(),
      ).operator(model);

      expect(result.process, isA<Addition>());
    });

    test('returns copyWith when n2 is null and n1 exists', () {
      final model = modelWith(n1: 5);

      final result = const Operator(
        value: '+',
        process: Addition(),
      ).operator(model);

      expect(result.process, isA<Addition>());
      expect(result.n1, 5);
    });
  });
}