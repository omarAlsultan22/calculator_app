import 'package:flutter/material.dart';
import 'data/models/calculator_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculator/presentation/cubit/cubit.dart';
import 'package:calculator/presentation/screens/calculator_screen.dart';


void main() {
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                CalculatorCubit(calculatorModel: CalculatorModel()))
      ], child: const MyApp(),)
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}



