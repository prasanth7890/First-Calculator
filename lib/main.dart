import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String output = "0";

  String _output = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText)
  {
    if(buttonText == "CLEAR")
      {
        _output = "";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      }
    else if (buttonText =='+' || buttonText =='/' || buttonText =='x' || buttonText =='-')
      {
        num1 = double.parse(output);
        operand = buttonText;
        _output = "0";
      }
    else if(buttonText == '.') {
      if(_output.contains(".")) {
        print('already Contains a decimal');
        return;
      }
      else {
        _output = _output + buttonText;
      }
    }
    else if(buttonText == "=")
      {
        num2 = double.parse(_output);

        if(operand == "+")
          _output = (num1 + num2).toString();
        if(operand == "-")
          _output = (num1 - num2).toString();
        if(operand == "/")
          _output = (num1 / num2).toString();
        if(operand == "x")
          _output = (num1 * num2).toString();

        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {

      output = double.parse(_output).toStringAsFixed(2);

    });

  }


  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0,
                ),
                alignment: Alignment.centerRight,
                child: Text(
              output,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            )),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("x"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("CLEAR"),
                    buildButton("="),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
