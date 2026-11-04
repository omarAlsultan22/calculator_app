import 'package:calculator/domain/use_cases/base/processes_model.dart';


class FakeProcess implements Processes {
  final double result;
  final Object? error;

  FakeProcess({required this.result, this.error});

  @override
  double process(double n1, double n2) {
    if (error != null) throw error!;
    return result;
  }
}