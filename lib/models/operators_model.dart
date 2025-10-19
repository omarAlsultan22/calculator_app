import 'package:flutter/cupertino.dart';

abstract class Operators {
  final String? value;

  const Operators({this.value});

  void operator(BuildContext context);
}


