import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // lets now create the on pressed method

  String Output = "0";
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  PressedButton(String val) {
    print(val);
    // now lets add some conditions

    if (val == "AC") {
      _out = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (val == "+" || val == "*" || val == "-" || val == "/") {
      num1 = double.parse(Output);
      operand = val;
      _out = "0";
      Output = Output + val;
    } else if (val == ".") {
      if (_out.contains(".")) {
        return;
      } else {
        _out = _out + val;
      }
    } else if (val == "=") {
      num2 = double.parse(Output);
      if (operand == "+") {
        _out = (num1 + num2).toString();
      }
      if (operand == "-") {
        _out = (num1 - num2).toString();
      }
      if (operand == "*") {
        _out = (num1 * num2).toString();
      }
      if (operand == "/") {
        _out = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
    } else {
      _out = _out + val;
    }
    setState(() {
      Output = double.parse(_out).toStringAsFixed(2);
    });
  }

// Button widgets
  Widget numBtn(String btnVal) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(12.0),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          elevation: 18.0,
          padding: EdgeInsets.all(20.0),
          child: Text(
            btnVal,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: Colors.cyan,
          onPressed: () => PressedButton(btnVal),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              margin: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
              alignment: Alignment.topLeft,
              child: Text(
                "Flutter Calculator",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                ),
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            Container(
              color: Colors.black,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
              child: Text(
                Output,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.red,
              ),
            ),
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  // now lets create button ui
                  Row(
                    children: [
                      numBtn("."),
                      numBtn("AC"),
                      numBtn("<-"),
                      numBtn("*"),
                    ],
                  ),
                  Row(
                    children: [
                      numBtn("7"),
                      numBtn("8"),
                      numBtn("9"),
                      numBtn("/"),
                    ],
                  ),
                  Row(
                    children: [
                      numBtn("4"),
                      numBtn("5"),
                      numBtn("6"),
                      numBtn("+"),
                    ],
                  ),
                  Row(
                    children: [
                      numBtn("1"),
                      numBtn("2"),
                      numBtn("3"),
                      numBtn("-"),
                    ],
                  ),
                  Row(
                    children: [
                      numBtn("0"),
                      numBtn("="),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
