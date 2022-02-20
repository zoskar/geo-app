import 'package:flutter/material.dart';

import 'package:geoapp/widgets/singleCountry.dart';

class CountryViewSpecialCase extends StatefulWidget {
  final String widgetTitle;
  final country;
  final VoidCallback searchView;

  CountryViewSpecialCase(
      {Key? key, required this.widgetTitle,
      required this.country,
      required this.searchView}) : super(key: key);

  @override
  State<CountryViewSpecialCase> createState() => _CountryViewSpecialCaseState();
}

class _CountryViewSpecialCaseState extends State<CountryViewSpecialCase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.widgetTitle),
          leading: IconButton(
            onPressed: widget.searchView,
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleCountry(country: widget.country));
  }
}
