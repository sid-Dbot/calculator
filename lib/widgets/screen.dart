import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final num1 = TextEditingController();
  final num2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          child: TextField(
            controller: num1,
          ),
        ),
        Card(
          child: TextField(
            controller: num2,
          ),
        )
      ],
    );
  }
}
