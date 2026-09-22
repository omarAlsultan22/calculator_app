import 'base/processes_model.dart';


class CalculatorService {
  static double calculate(
      {required Processes? process, required double? n1, required double? n2}) {
    if (process == null) {
      throw Exception('Process is not set');
    }
    return process.process(n1!, n2!);
  }

  static List<double> getReversedNumbers(List<double> numbers) {
    return numbers.reversed.toList();
  }

  static List<Processes> getReversedProcesses(List<Processes> processes) {
    return processes.reversed.toList();
  }
}