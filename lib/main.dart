import 'app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculator/presentation/cubit/calculator_cubit.dart';


void main() {
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                CalculatorCubit())
      ], child: const MyApp(),)
  );
}






