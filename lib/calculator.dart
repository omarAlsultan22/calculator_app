import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  Widget calculator(String bnt, Color bnc, Color txc) {
    return MaterialButton(
      onPressed: () {
        calculation(bnt);
      },
      color: bnc,
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(20),
      child: Text(bnt,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
          color: txc,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /*
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF121212),
              Color(0xFF0A0A0A),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
         */
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[850]!,
              Colors.grey[900]!,
              Colors.black,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,
                  style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)
              ],
            ), const SizedBox(height: 60.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculator('C', Colors.red.shade700, Colors.white),
                calculator('()', Colors.blue.shade900, Colors.white),
                calculator('%', Colors.blue.shade900, Colors.white),
                calculator('/', Colors.blue.shade900, Colors.white),
              ],
            ), const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculator('7', Colors.amber, Colors.white),
                calculator('8', Colors.amber, Colors.white),
                calculator('9', Colors.amber, Colors.white),
                calculator('x', Colors.blue.shade900, Colors.white),
              ],
            ), const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculator('4', Colors.amber, Colors.white),
                calculator('5', Colors.amber, Colors.white),
                calculator('6', Colors.amber, Colors.white),
                calculator('-', Colors.blue.shade900, Colors.white),
              ],
            ), const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculator('1', Colors.amber, Colors.white),
                calculator('2', Colors.amber, Colors.white),
                calculator('3', Colors.amber, Colors.white),
                calculator('+', Colors.blue.shade900, Colors.white),
              ],
            ), const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculator('+/-', Colors.grey, Colors.white),
                calculator('0', Colors.amber, Colors.white),
                calculator('.', Colors.grey, Colors.white),
                calculator('=', Colors.green.shade700, Colors.white),
              ],
            ), const SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }

  String text = '0';
  double n1 = 0.0;
  double n2 = 0.0;
  String opr = '';
  String result = '';
  String finalResult = '0';
  bool isNegative = false;
  bool isParenthesisOpen = false;

  void calculation(String btn) {
    String multi() {
      result = (n1 * n2).toString();
      return DoesDecimalcontain(result);
    }
    String divide() {
      result = (n1 / n2).toString();
      return DoesDecimalcontain(result);
    }
    String munse() {
      result = (n1 - n2).toString();
      return DoesDecimalcontain(result);
    }
    String add() {
      result = (n1 + n2).toString();
      return DoesDecimalcontain(result);
    }
    String mod() {
      result = (n1 % n2).toString();
      return DoesDecimalcontain(result);
    }

    if (btn == 'C') {
      n1 = 0.0;
      n2 = 0.0;
      result = '';
      finalResult = '0';
      isNegative = false;
      isParenthesisOpen = false;
    }
    else if (btn == '+/-') {
      if (finalResult != '0') {
        isNegative = !isNegative;
        if (isNegative) {
          finalResult = '-$finalResult';
        } else {
          if (finalResult.startsWith('-')) {
            finalResult = finalResult.substring(1);
          }
        }
      }
    }
    else if (btn == '()') {
      if (isParenthesisOpen) {
        finalResult += ')';
        isParenthesisOpen = false;
      } else {
        finalResult += '(';
        isParenthesisOpen = true;
      }
    }
    else if (btn == '+' || btn == '-' || btn == 'x' || btn == '/' || btn == '%' || btn == '=') {
      if (n1 == 0) {
        n1 = double.parse(result);
      }
      else {
        n2 = double.parse(result);
      }

      if(btn == '=') {
        if (opr == 'x') {
          finalResult = multi();
        }
        else if (opr == '/') {
          finalResult = divide();
        }
        else if (opr == '+') {
          finalResult = add();
        }
        else if (opr == '-'){
          finalResult = munse();
        }
        else{
          finalResult = mod();
        }
      }

      opr = btn;
      result = '';

    }
    else {
      result += btn;
      finalResult = result;
    }

    setState((){
      text = finalResult;
    });
  }

  String DoesDecimalcontain(dynamic result) {
    if(result.toString().contains('.')) {
      List<String> splitDicimal = result.toString().split('.');
      if(!(int.parse(splitDicimal[1]) > 0)) {
        return result = splitDicimal[0].toString();
      }
    }
    return result;
  }
}