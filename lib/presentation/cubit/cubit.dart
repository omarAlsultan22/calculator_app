import '../states/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/calculator_model.dart';
import '../../domain/usecases/base/operators_model.dart';


class CalculatorCubit extends Cubit<CalculatorStates> {
  final CalculatorModel _calculatorModel;

  CalculatorCubit({required CalculatorModel calculatorModel}) :  _calculatorModel = calculatorModel ,super(InitialState());

  static CalculatorCubit get(context) => BlocProvider.of(context);


  void getButtonResult(Operators operators) {
    try {
      final result = operators.operator(_calculatorModel);
      emit(SuccessState(value: result.finalResult));
    }
    catch (e) {
      emit(ErrorState(value: e.toString()));
    }
  }
}