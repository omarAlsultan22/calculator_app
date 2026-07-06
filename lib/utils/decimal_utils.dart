import 'package:calculator/constants/app_strings.dart';


abstract class Decimal {
  static String doesDecimalContain(String result) {
    if (result.toString().contains(AppStrings.decimal)) {
      List<String> splitDecimal = result.toString().split(AppStrings.decimal);
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}