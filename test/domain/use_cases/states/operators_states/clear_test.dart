import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/calculator_models.dart';
import 'package:calculator/domain/use_cases/states/processes_states.dart';
import 'package:calculator/domain/use_cases/states/operators_states.dart';


void main() {
  group('Clear', () {
    test('returns an empty CalculatorModel', () {
      final model = modelWith(
        n1: 5, n2: 3, process: const Addition(), result: '5+3', finalResult: '5+3',
      );

      final result = const Clear(value: 'C').operator(model);

      expect(result.n1, isNull);
      expect(result.n2, isNull);
      expect(result.process, isNull);
      expect(result.result, '');
    });
  });
}