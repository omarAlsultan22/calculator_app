import '../data/models/calculator_model.dart';
import 'package:calculator/domain/usecases/calculator_service.dart';


class CalculatorUtils {
  static double getResult(CalculatorModel calculatorModel) {
    var result = CalculatorService.calculate(
        n1: calculatorModel.n1,
        n2: calculatorModel.n2,
        process: calculatorModel.process
    );

    if (!calculatorModel.numbersIsEmpty) {
      for (int index = 0; index < calculatorModel.numbersListLength &&
          index < calculatorModel.processesListLength; index++) {
        final newCalculatorModel = calculatorModel.copyWith(currentIndex: index);
        final currentProcess = newCalculatorModel.currentProcess;
        result = currentProcess.process(newCalculatorModel.currentNumber, result);
      }
    }
    return result;
  }
}
