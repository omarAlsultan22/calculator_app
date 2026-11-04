import 'package:calculator/data/models/calculator_model.dart';
import 'package:calculator/domain/use_cases/base/processes_model.dart';


CalculatorModel modelWith({
  double? n1,
  double? n2,
  Processes? process,
  String result = '',
  String finalResult = '0',
  List<double> numbers = const [],
  List<Processes> processes = const [],
  List<String> parentheses = const [],
  int currentArc = 0,
  int currentIndex = 0,
  bool isNegative = false,
}) {
  return CalculatorModel(
    n1: n1,
    n2: n2,
    process: process,
    result: result,
    finalResult: finalResult,
    numbers: numbers,
    processes: processes,
    parentheses: parentheses,
    currentArc: currentArc,
    currentIndex: currentIndex,
    isNegative: isNegative,
  );
}

CalculatorModel get emptyModel => CalculatorModel();