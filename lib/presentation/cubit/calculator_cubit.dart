import '../states/calculator_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/calculator_model.dart';
import '../../domain/usecases/base/operators_model.dart';


class CalculatorCubit extends Cubit<CalculatorStates> {
  CalculatorCubit() :super(InitialState(calculatorModel: CalculatorModel()));

  static CalculatorCubit get(context) => BlocProvider.of(context);

  void getButtonResult(Operators operators) {
    try {
      final newCalculatorModel = operators.operator(state.calculatorModel);
      emit(SuccessState(calculatorModel: newCalculatorModel));
    }
    catch (e) {
      emit(ErrorState(
          message: e.toString(),
          calculatorModel: state.calculatorModel)
      );
    }
  }
}