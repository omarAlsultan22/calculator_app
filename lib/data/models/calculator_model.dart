import '../../constants/app_strings.dart';
import '../../domain/usecases/base/processes_model.dart';
import 'package:calculator/domain/usecases/calculator_service.dart';


class CalculatorModel {
  double? n1;
  double? n2;
  String result;
  int currentArc;
  bool isNegative;
  int currentIndex;
  String finalResult;
  Processes? process;
  List<double> numbers;
  List<String> parentheses;
  List<Processes> processes;

  CalculatorModel({
    this.n1,
    this.n2,
    this.process,
    this.currentArc = 0,
    this.currentIndex = 0,
    this.isNegative = false,
    this.numbers = const [],
    this.processes = const [],
    this.parentheses = const [],
    this.result = AppStrings.empty,
    this.finalResult = AppStrings.zero,
  });

  CalculatorModel copyWith({
    double? n1,
    double? n2,
    String? result,
    int? currentArc,
    bool? isNegative,
    int? currentIndex,
    Processes? process,
    String? finalResult,
    List<double>? numbers,
    List<String>? parentheses,
    List<Processes>? processes
  }) {
    return CalculatorModel(
      n1: n1,
      n2: n2,
      process: process,
      result: result ?? this.result,
      numbers: numbers ?? this.numbers,
      processes: processes ?? this.processes,
      currentArc: currentArc ?? this.currentArc,
      isNegative: isNegative ?? this.isNegative,
      parentheses: parentheses ?? this.parentheses,
      finalResult: finalResult ?? this.finalResult,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  bool get numbersIsEmpty => numbers.isEmpty;

  int get parenthesesListLength => parentheses.length;

  bool get parenthesesListIsEmpty => parentheses.isEmpty;

  late List<double> getNumbersList = parenthesesListIsEmpty
      ? numbers : CalculatorService.getReversedNumbers(numbers);

  late List<Processes> getProcessesList = parenthesesListIsEmpty
      ? processes : CalculatorService.getReversedProcesses(processes);

  int get numbersListLength => getNumbersList.length;

  int get processesListLength => getProcessesList.length;

  double get currentNumber => getNumbersList[currentIndex];

  Processes get currentProcess => getProcessesList[currentIndex];

  CalculatorModel clear() => CalculatorModel();
}
