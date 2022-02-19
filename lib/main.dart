import 'package:flutter/material.dart';
import 'package:geoapp/searchView.dart';

import './countryView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoApp',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MyHomePage(title: 'Geo-app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _selectedValue = 'By name';
  int flag = 1;
  final _myController = TextEditingController();

  void _pickList(String? newValue) {
    setState(() {
      _selectedValue = newValue!;
    });
  }

  void _countryView() {
    setState(() {
      flag = 1;
    });
  }

  void _searchView() {
    setState(() {
      flag = 0;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (flag == 0) {
      return SearchView(
          myController: _myController,
          countryView: _countryView,
          pickList: _pickList,
          selectedValue: _selectedValue,
          widgetTitle: widget.title);
    } else {
      return CountryView(
        searchView: _searchView,
        widgetTitle: widget.title,
      );
    }
  }
}
