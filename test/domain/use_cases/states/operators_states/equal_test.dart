import 'package:calculator/domain/use_cases/states/operators_states.dart';
import 'package:calculator/domain/use_cases/states/processes_states.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/calculator_models.dart';


void main() {
  group('Equal', () {
    test('returns same model when n1 is null', () {
      final model = modelWith(n2: 3, process: const Addition());
      final result = const Equal(value: '=').operator(model);
      expect(result, same(model));
    });

    test('returns same model when n2 is null', () {
      final model = modelWith(n1: 5, process: const Addition());
      final result = const Equal(value: '=').operator(model);
      expect(result, same(model));
    });

    test('returns same model when process is null', () {
      final model = modelWith(n1: 5, n2: 3);
      final result = const Equal(value: '=').operator(model);
      expect(result, same(model));
    });

    test('computes result and resets lists', () {
      final model = modelWith(
        n1: 5,
        n2: 3,
        process: const Addition(),
        result: '5+3',
        finalResult: '5+3',
        numbers: [5.0],
        processes: [const Addition()],
      );

      final result = const Equal(value: '=').operator(model);

      expect(result.n1, 8);
      expect(result.n2, isNull);
      expect(result.process, isNull);
      expect(result.numbers, isEmpty);
      expect(result.processes, isEmpty);
      expect(result.parentheses, isEmpty);
      expect(result.result, '');
    });
  });
}