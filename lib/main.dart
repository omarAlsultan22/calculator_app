import 'app/my_app.dart';
import 'package:flutter/material.dart';
import 'data/models/calculator_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculator/presentation/cubit/cubit.dart';


void main() {
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                CalculatorCubit(calculatorModel: CalculatorModel()))
      ], child: const MyApp(),)
  );
}






