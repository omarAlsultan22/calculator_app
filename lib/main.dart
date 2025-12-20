import 'package:calculator/shared/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/calculator_layout.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                CalculatorCubit())
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



