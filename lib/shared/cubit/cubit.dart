import 'package:calculator/models/calculator_model.dart';
import '../../usecases/base/operators_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/states.dart';


class CalculatorCubit extends Cubit<CalculatorStates> {
  CalculatorModel? calculatorModel;

  CalculatorCubit({required this.calculatorModel}) : super(InitialState());

  static CalculatorCubit get(context) => BlocProvider.of(context);


  void getButtonResult(Operators operators) {
    try {
      final result = operators.operator(calculatorModel!);
      emit(SuccessState(value: result));
    }
    catch (e) {
      emit(ErrorState(value: e.toString()));
    }
  }
}