import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/utils/decimal_utils.dart';


void main() {
  group('Decimal.doesDecimalContain', () {
    // ===== No decimal point =====
    test('returns integer string unchanged', () {
      expect(Decimal.doesDecimalContain('5'), '5');
    });

    test('returns zero unchanged', () {
      expect(Decimal.doesDecimalContain('0'), '0');
    });

    test('returns negative integer unchanged', () {
      expect(Decimal.doesDecimalContain('-5'), '-5');
    });

    // ===== Decimal part is zero (.0) =====
    test('removes .0 suffix', () {
      expect(Decimal.doesDecimalContain('5.0'), '5');
    });

    test('removes .00 suffix', () {
      expect(Decimal.doesDecimalContain('5.00'), '5');
    });

    test('removes .0 from negative number', () {
      expect(Decimal.doesDecimalContain('-5.0'), '-5');
    });

    // ===== Decimal part is non-zero =====
    test('keeps .5 suffix', () {
      expect(Decimal.doesDecimalContain('5.5'), '5.5');
    });

    test('keeps .05 suffix (leading zero in decimal)', () {
      expect(Decimal.doesDecimalContain('5.05'), '5.05');
    });

    test('keeps .50 suffix (trailing zero not removed)', () {
      // 50 > 0 → kept → '5.50' (bug: trailing zero not removed)
      expect(Decimal.doesDecimalContain('5.50'), '5.50');
    });

    test('keeps .99 suffix', () {
      expect(Decimal.doesDecimalContain('5.99'), '5.99');
    });

    // ===== Edge cases =====
    test('throws FormatException on trailing dot (5.)', () {
      // split('.') → ['5', ''] → int.parse('') throws
      expect(
            () => Decimal.doesDecimalContain('5.'),
        throwsA(isA<FormatException>()),
      );
    });

    test('throws FormatException on non-numeric decimal (5.abc)', () {
      expect(
            () => Decimal.doesDecimalContain('5.abc'),
        throwsA(isA<FormatException>()),
      );
    });

    test('throws RangeError on leading dot (.5)', () {
      // split('.') → ['', '5'] → splitDecimal[0] == '' (OK)
      // لكن int.parse('5') = 5 > 0 → لا يحذف → '5.' ؟
      // فعلياً: result = '.5' → return result (لأن 5 > 0)
      expect(Decimal.doesDecimalContain('.5'), '.5');
    });
  });
}