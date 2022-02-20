import 'package:flutter/material.dart';

import 'package:geoapp/Views/countryViewSpecialCase.dart';
import 'package:geoapp/Views/searchView.dart';
import 'Views/countryView.dart';

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
      theme:
          ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Montserrat'),
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
  int flag = 0;
  final _myController = TextEditingController();
  late var _country;

  void _pickList(String? newValue) {
    setState(() {
      _selectedValue = newValue!;
    });
  }

  void _searchView() {
    setState(() {
      flag = 0;
    });
  }

  void _countryView() {
    setState(() {
      flag = 1;
    });
  }

  void _countryViewFromCountries(var country) {
    setState(() {
      flag = 2;
      _myController.text = country['name']['common'];
      _selectedValue = 'By name';
      _country = country;
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
    } else if (flag == 1) {
      return CountryView(
        selectedValue: _selectedValue,
        searchView: _searchView,
        countryViewFromCountries: _countryViewFromCountries,
        widgetTitle: widget.title,
        request: _myController.text,
        specialCase: false,
      );
    } else {
      return CountryViewSpecialCase(
        widgetTitle: widget.title,
        country: _country,
        searchView: _searchView,
      );
    }
  }
}
