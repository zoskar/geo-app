import 'package:flutter/material.dart';

class DropList extends StatelessWidget {
  final items = ['By name', 'By continent', 'By currency', 'By capital'];
  final Function handler;
  final String selectedValue;

  DropList({required this.handler, required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurple,
      ),
      onChanged: (String? newValue) {
        handler(newValue);
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
