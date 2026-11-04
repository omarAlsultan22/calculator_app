import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/domain/use_cases/states/processes_states.dart';


void main() {
  group('Addition', () {
    test('adds two positive numbers', () {
      expect(const Addition().process(2, 3), 5);
    });

    test('adds negative and positive', () {
      expect(const Addition().process(-5, 3), -2);
    });

    test('adds two negatives', () {
      expect(const Addition().process(-2, -3), -5);
    });

    test('adds zero', () {
      expect(const Addition().process(5, 0), 5);
    });
  });

  group('Subtraction', () {
    test('subtracts two positive numbers', () {
      expect(const Subtraction().process(5, 3), 2);
    });

    test('subtracts larger from smaller (negative result)', () {
      expect(const Subtraction().process(3, 5), -2);
    });

    test('subtracts negative', () {
      expect(const Subtraction().process(5, -3), 8);
    });

    test('subtracts zero', () {
      expect(const Subtraction().process(5, 0), 5);
    });
  });

  group('Multiplication', () {
    test('multiplies two positive numbers', () {
      expect(const Multiplication().process(2, 3), 6);
    });

    test('multiplies positive and negative', () {
      expect(const Multiplication().process(5, -3), -15);
    });

    test('multiplies two negatives', () {
      expect(const Multiplication().process(-2, -3), 6);
    });

    test('multiplies by zero', () {
      expect(const Multiplication().process(5, 0), 0);
    });
  });

  group('Division', () {
    test('divides two positive numbers', () {
      expect(const Division().process(6, 3), 2);
    });

    test('divides with decimal result', () {
      expect(const Division().process(5, 2), 2.5);
    });

    test('divides negative by positive', () {
      expect(const Division().process(-6, 3), -2);
    });

    test('throws FormatException when dividing by zero', () {
      expect(
            () => const Division().process(5, 0),
        throwsA(isA<FormatException>()),
      );
    });

    test('throws with correct message when dividing by zero', () {
      expect(
            () => const Division().process(5, 0),
        throwsA(
          isA<FormatException>().having(
                (e) => e.message,
            'message',
            contains('divide by zero'),
          ),
        ),
      );
    });
  });

  group('Modulus', () {
    test('returns remainder of division', () {
      expect(const Modulus().process(5, 3), 2);
    });

    test('returns zero when evenly divisible', () {
      expect(const Modulus().process(6, 3), 0);
    });

    test('returns negative remainder with negative dividend', () {
      expect(const Modulus().process(-5, 3), -2);
    });

    test('handles decimal modulus', () {
      expect(const Modulus().process(5.5, 2), closeTo(1.5, 0.0001));
    });
  });
}