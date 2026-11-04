import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/calculator_models.dart';
import 'package:calculator/domain/use_cases/states/operators_states.dart';
import 'package:calculator/domain/use_cases/states/processes_states.dart';


void main() {
  group('Number', () {
    test('appends digit and updates n1', () {
      final model = modelWith(result: '5', finalResult: '5', n1: 5);

      final result = const Number(value: '3').operator(model);

      expect(result.result, '53');
      expect(result.n1, 53);
    });

    test('prevents duplicate decimal point', () {
      final model = modelWith(result: '5.5', finalResult: '5.5', n1: 5.5);

      final result = const Number(value: '.').operator(model);

      expect(result.result, '5.5'); // unchanged
    });

    test('starts with 0 when entering . on empty', () {
      final model = modelWith();

      final result = const Number(value: '.').operator(model);

      expect(result.result, '0.');
    });

    test('prevents leading zeros (00)', () {
      final model = modelWith(result: '0', finalResult: '0');

      final result = const Number(value: '0').operator(model);

      expect(result.result, '0');
    });

    test('updates n2 when process exists', () {
      final model = modelWith(
        n1: 5, process: const Addition(), result: '5+', finalResult: '5+',
      );

      final result = const Number(value: '3').operator(model);

      expect(result.n2, 3);
      expect(result.n1, 5);
    });

    test('does not exceed maxDigits', () {
      final long = '1' * Number.maxDigits;
      final model = modelWith(result: long, finalResult: long, n1: double.parse(long));

      final result = const Number(value: '9').operator(model);

      expect(result.result, long); // unchanged
    });

    test('handles parentheses in result', () {
      final model = modelWith(result: '(5', finalResult: '(5');

      final result = const Number(value: '3').operator(model);

      expect(result.result, '(53');
    });
  });
}