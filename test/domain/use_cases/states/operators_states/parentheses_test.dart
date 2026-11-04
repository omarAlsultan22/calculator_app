import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/calculator_models.dart';
import 'package:calculator/domain/use_cases/states/operators_states.dart';
import 'package:calculator/domain/use_cases/states/processes_states.dart';


void main() {
  group('Parentheses', () {
    test('opens a new parenthesis on empty', () {
      final model = modelWith();

      final result = const Parentheses(value: '(').operator(model);

      expect(result.result, '(');
      expect(result.parentheses, ['(']);
    });

    test('opens parenthesis after a number', () {
      final model = modelWith(n1: 5, result: '5', finalResult: '5');

      final result = const Parentheses(value: '(').operator(model);

      expect(result.result, '5(');
      expect(result.numbers, [5.0]);
      expect(result.parentheses, ['(']);
    });

    test('opens parenthesis after an operator', () {
      final model = modelWith(
        n1: 5,
        result: '5+',
        finalResult: '5+',
        process: const Addition()
      );

      final result = const Parentheses(value: '(').operator(model);

      expect(result.result, '5+(');
      expect(result.numbers, [5.0]);
      expect(result.processes.length, 1);
    });

    test('closes parenthesis when conditions met', () {
      final model = modelWith(
        n1: 5,
        result: '(5',
        finalResult: '(5',
        parentheses: ['('],
        currentArc: 0,
      );

      final result = const Parentheses(value: '(').operator(model);

      expect(result.result, '(5)');
    });

    test('opens parenthesis when n1 is null and process is null', () {
      final model = modelWith(
        result: '(',
        finalResult: '(',
        parentheses: ['('],
      );

      final result = const Parentheses(value: '(').operator(model);

      expect(result.result, '((');
    });
  });
}