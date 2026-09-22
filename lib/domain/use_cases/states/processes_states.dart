import '../base/processes_model.dart';


class Multiplication implements Processes {
  const Multiplication();

  @override
  double process(double n1, double n2) {
    return (n1 * n2);
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
      return (n1 / n2);
    }
    catch (e) {
      rethrow;
    }
  }
}


class Subtraction implements Processes {
  const Subtraction();

  @override
  double process(double n1, double n2) {
    return (n1 - n2);
  }
}


class Addition implements Processes {
  const Addition();

  @override
  double process(double n1, double n2) {
    return (n1 + n2);
  }
}


class Modulus implements Processes {
  const Modulus();

  @override
  double process(double n1, double n2) {
    return (n1 % n2);
  }
}



