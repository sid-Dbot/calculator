import 'package:flutter/material.dart';

import './widgets/screen.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lime,
        ),
        textTheme: TextTheme(
          button: TextStyle(fontSize: 20),
        ),
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
      _c = a - b;
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Card(
                elevation: 7,
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Card(
                      child: Text('$a'),
                    ),
                    Card(
                      child: Text('$_o'),
                    ),
                    Card(
                      child: Text('$b'),
                    ),
                    Container(
                      child: Text(' =  $_c'),
                    ),
                  ],
                ),
              ),
              TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter a number',
                  ),
                  onChanged: (value) => n1 = value
                  //controller: num1,
                  ),
              TextField(
                decoration: InputDecoration(labelText: 'Enter another number'),
                controller: num2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: clear,
                        child: Text('Clear')),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(color: Colors.black)),
                      onPressed: add,
                      child: Icon(Icons.add)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 9,
                    ),
                    child: Text('1'),
                    onPressed: () {},
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 9,
                    ),
                    child: Text('2'),
                    onPressed: () {},
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 9,
                    ),
                    onPressed: () {},
                    child: Text('3'),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(side: BorderSide(width: 10)),
                          side: BorderSide(color: Colors.black)),
                      onPressed: subtract,
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 9,
                    ),
                    onPressed: () {},
                    child: Text('4'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 9,
                    ),
                    onPressed: () {},
                    child: Text('5'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 9,
                    ),
                    onPressed: () {},
                    child: Text('6'),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(color: Colors.black)),
                      onPressed: multiply,
                      child: Text(
                        'X',
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 9,
                    ),
                    onPressed: () {},
                    child: Text('7'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 9,
                    ),
                    onPressed: () {},
                    child: Text('8'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 9,
                    ),
                    onPressed: () {},
                    child: Text('9'),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(color: Colors.black)),
                      onPressed: divide,
                      child: Text('/', style: TextStyle(fontSize: 20))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('0'),
                      style: ButtonStyle(),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(color: Colors.black)),
                    onPressed: () {},
                    child: Text('.'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: StadiumBorder(),
                    ),
                    onPressed: submit,
                    child: Text(
                      '=',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
