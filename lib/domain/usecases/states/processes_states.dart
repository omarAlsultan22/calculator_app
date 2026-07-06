import '../../../constants/app_strings.dart';
import '../base/processes_model.dart';


class Multiplication implements Processes{
  const Multiplication();

  @override
  double process(double n1, double n2) {
    final result = (n1 * n2).toString();
    return Decimal.doesDecimalContain(result);
  }
}


class Division implements Processes {
  const Division();

  @override
  double process(double n1, double n2) {
    try {
      if (n2 == 0) {
        throw const FormatException('Can’t divide by zero');
      }
      final result = (n1 / n2).toString();
      return Decimal.doesDecimalContain(result);
    }
    catch (e) {
      rethrow;
    }
  }
}


class Subtraction implements Processes{
  const Subtraction();

  @override
  double process(double n1, double n2) {
    final result =  (n1 - n2).toString();
    return Decimal.doesDecimalContain(result);
  }
}


class Addition implements Processes{
  const Addition();

  @override
  double process(double n1, double n2) {
    final result = (n1 + n2).toString();
    return Decimal.doesDecimalContain(result);
  }
}


class Modulus implements Processes{
  const Modulus();

  @override
  double process(double n1, double n2) {
    final result = (n1 % n2).toString();
    return Decimal.doesDecimalContain(result);
  }
}


abstract class Decimal {
  static double doesDecimalContain(String result) {
    double value = double.parse(result);

    if (result.contains(AppStrings.decimal)) {
      List<String> splitDecimal = result.split(AppStrings.decimal);
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return double.parse(splitDecimal[0]);
      }
    }
    return value;
  }
}


