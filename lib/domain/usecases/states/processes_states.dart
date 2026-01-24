import '../base/processes_model.dart';


class Multiplication implements Processes{

  @override
  String process(double n1, double n2) {
    final result = (n1 * n2).toString();
    return doesDecimalContain(result);
  }
}


class Division implements Processes {

  @override
  String process(double n1, double n2) {

    if (n2 == 0) {
      throw const FormatException('Can’t divide by zero');
    }
    final result = (n1 / n2).toString();
    return doesDecimalContain(result);
  }
}


class Subtraction implements Processes{

  @override
  String process(double n1, double n2) {
    final result =  (n1 - n2).toString();
    return doesDecimalContain(result);
  }
}


class Addition implements Processes{

  @override
  String process(double n1, double n2) {
    final result = (n1 + n2).toString();
    return doesDecimalContain(result);
  }
}


class Modulus implements Processes{

  @override
  String process(double n1, double n2) {
    final result = (n1 % n2).toString();
    return doesDecimalContain(result);
  }
}


String doesDecimalContain(dynamic result) {
  if(result.toString().contains('.')) {
    List<String> splitDecimal = result.toString().split('.');
    if(!(int.parse(splitDecimal[1]) > 0)) {
      return result = splitDecimal[0].toString();
    }
  }
  return result;
}
