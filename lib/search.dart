import 'package:flutter/material.dart';

class Search extends StatelessWidget {

  var myController;

  Search({required this.myController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10),
      child: TextField(
        controller: myController,
        maxLength: 60,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            counterText: '',
            suffixIcon: const Padding(
              padding: EdgeInsetsDirectional.only(end: 5),
              child: Icon(Icons.search),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            filled: true,
            hintStyle: const TextStyle(color: Colors.grey),
            hintText: 'Enter text',
            fillColor: Colors.white70),
      ),
    );
  }
}
