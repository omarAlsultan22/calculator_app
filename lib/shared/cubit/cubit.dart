import '../../models/processes_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculator/shared/cubit/states.dart';


class CalculatorCubit extends Cubit<CalculatorStates> {
  CalculatorCubit() : super(InitialState());

  static CalculatorCubit get(context) => BlocProvider.of(context);
  String text = '0';
  double n1 = 0.0;
  double n2 = 0.0;
  String opr = '';
  String result = '';
  String finalResult = '0';
  bool isNegative = false;
  bool isParenthesisOpen = false;
  Processes? processes;

  String get currentResult => finalResult;

  void getOperator(String btn){
    result += btn;
    finalResult = result;
    n1 == 0 ? n1 = double.parse(result) : n2 = double.parse(result);
    emit(SuccessState(value: finalResult));
  }

  void getProcessOperator(Processes process){
    if(n1 != 0.0) {
      processes = process;
      result = '';
      emit(SuccessState(value: finalResult));
    }
  }

  void getFinalResult() {
    try {
      finalResult = processes!.process(n1, n2);
      throw('It cannot be divided by zero');
    }
    catch (error) {
      emit(ErrorState(value: error.toString()));
    }
  }

  void getParentheses(){
    if (isParenthesisOpen) {
      finalResult += ')';
      isParenthesisOpen = false;
    } else {
      finalResult += '(';
      isParenthesisOpen = true;
    }
    emit(SuccessState(value: finalResult));
  }

  void getPlusMunsSign(){
    if (finalResult != '0') {
      isNegative = !isNegative;
      if (isNegative) {
        finalResult = '-$finalResult';
      } else {
        if (finalResult.startsWith('-')) {
          finalResult = finalResult.substring(1);
        }
      }
    }
    emit(SuccessState(value: finalResult));
  }

  void clear(){
    n1 = 0.0;
    n2 = 0.0;
    result = '';
    finalResult = '0';
    isNegative = false;
    isParenthesisOpen = false;
    emit(SuccessState(value: finalResult));
  }
}