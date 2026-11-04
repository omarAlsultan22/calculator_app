import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/calculator_models.dart';
import 'package:calculator/domain/use_cases/states/operators_states.dart';
import 'package:calculator/domain/use_cases/states/processes_states.dart';


void main() {
  group('PlusMunsSign', () {
    test('returns same model when result is empty', () {
      final model = modelWith();
      final result = const PlusMunsSign(value: '±').operator(model);
      expect(result, same(model));
    });

    test('returns same model when result is "0"', () {
      final model = modelWith(result: '0', finalResult: '0');
      final result = const PlusMunsSign(value: '±').operator(model);
      expect(result, same(model));
    });

    test('negates n1 when process is null', () {
      final model = modelWith(result: '5', finalResult: '5', n1: 5);

      final result = const PlusMunsSign(value: '±').operator(model);

      expect(result.result, '-5');
      expect(result.n1, -5);
      expect(result.isNegative, true);
    });

    test('removes negation when n1 is already negative', () {
      final model = modelWith(
        result: '-5',
        finalResult: '-5',
        n1: -5,
        isNegative: true,
      );

      final result = const PlusMunsSign(value: '±').operator(model);

      expect(result.result, '5');
      expect(result.n1, 5);
      expect(result.isNegative, false);
    });

    test('adds - after operator when n2 is null and last char is operator', () {
      final model = modelWith(
        n1: 5,
        process: const Addition(),
        result: '5+',
        finalResult: '5+',
      );

      final result = const PlusMunsSign(value: '±').operator(model);

      expect(result.result, '5+-');
      expect(result.isNegative, true);
    });

    test('negates n2 when n2 exists', () {
      final model = modelWith(
        n1: 5,
        n2: 3,
        process: const Addition(),
        result: '5+3',
        finalResult: '5+3',
      );

      final result = const PlusMunsSign(value: '±').operator(model);

      expect(result.result, '5+-3');
      expect(result.n2, -3);
      expect(result.isNegative, true);
    });
  });
}