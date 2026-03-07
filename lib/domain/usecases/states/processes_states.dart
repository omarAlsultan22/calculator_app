import '../base/processes_model.dart';


class Multiplication implements Processes{
  const Multiplication();

  @override
  String process(double n1, double n2) {
    final result = (n1 * n2).toString();
    return Decimal.doesDecimalContain(result);
  }
}


class Division implements Processes {
  const Division();

  @override
  String process(double n1, double n2) {
    if (n2 == 0) {
      throw const FormatException('Can’t divide by zero');
    }
    final result = (n1 / n2).toString();
    return Decimal.doesDecimalContain(result);
  }
}


class Subtraction implements Processes{
  const Subtraction();

  @override
  String process(double n1, double n2) {
    final result =  (n1 - n2).toString();
    return Decimal.doesDecimalContain(result);
  }
}


class Addition implements Processes{
  const Addition();

  @override
  String process(double n1, double n2) {
    final result = (n1 + n2).toString();
    return Decimal.doesDecimalContain(result);
  }
}


class Modulus implements Processes{
  const Modulus();

  @override
  String process(double n1, double n2) {
    final result = (n1 % n2).toString();
    return Decimal.doesDecimalContain(result);
  }
}


abstract class Decimal {
  static String doesDecimalContain(dynamic result) {
    const decimal = '.';
    if (result.toString().contains(decimal)) {
      List<String> splitDecimal = result.toString().split(decimal);
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}