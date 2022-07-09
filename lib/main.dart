import 'package:flutter/material.dart';

import './widgets/screen.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final num1 = TextEditingController();

  final num2 = TextEditingController();
  String n1 = '', n2 = '';

  num _c = 0, a = 5, b = 6;
  String _o = ' ';

  void add() {
    setState(() {
      _c = a + b;
      _o = '+';
    });
  }

  void subtract() {
    setState(() {
      a > b ? _c = a - b : _c = b - a;
      _o = '-';
    });
  }

  void multiply() {
    setState(() {
      _c = a * b;
      _o = '*';
    });
  }

  void divide() {
    setState(() {
      a > b ? _c = a / b : _c = b / a;
      _o = '/';
    });
  }

  void clear() {
    setState(() {
      _c = 0;
      _o = "";
    });
  }

  void submit() {
    setState(() {
      a = int.parse(n1);
      b = int.parse(num2.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Calculator')),
        body: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Card(
                    child: Text('$a'),
                  ),
                  Card(
                    child: Text('$_o'),
                  ),
                  Card(child: Text('$b')),
                ],
              ),
            ),
            Container(
              height: 50,
              child: Text('Results:  $_c'),
            ),
            Column(
              children: [
                Row(
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black)),
                        onPressed: add,
                        child: Icon(Icons.add)),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black)),
                        onPressed: subtract,
                        child: Text(
                          "-",
                          style: TextStyle(fontSize: 30),
                        )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black)),
                        onPressed: multiply,
                        child: Text(
                          '*',
                          style: TextStyle(fontSize: 30),
                        )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black)),
                        onPressed: divide,
                        child: Text('/', style: TextStyle(fontSize: 30)))
                  ],
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black)),
                    onPressed: clear,
                    child: Text('Clear')),
                TextField(onChanged: (value) => n1 = value
                    //controller: num1,
                    ),
                TextField(
                  controller: num2,
                ),
                TextButton(
                  onPressed: submit,
                  child: Text('Submit'),
                ),
                // TextField(
                //   controller: num2,
                // )
              ],
            )
          ],
        )
        // floatingActionButton: FloatingActionButton(
        //   child: Ic,
        //   onPressed: add,
        // )
        );
  }
}
