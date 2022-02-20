import 'package:flutter/material.dart';

import 'package:geoapp/widgets/singleCountry.dart';
import '../get data/getCountry.dart';
import '../widgets/multiCountries.dart';

class CountryView extends StatefulWidget {
  final String widgetTitle;
  final VoidCallback searchView;
  final Function countryViewFromCountries;
  final String request;
  final String selectedValue;
  final bool specialCase;

  const CountryView({
    Key? key,
    required this.countryViewFromCountries,
    required this.searchView,
    required this.widgetTitle,
    required this.request,
    required this.selectedValue,
    required this.specialCase
  }) : super(key: key);

  @override
  State<CountryView> createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
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
        body: Column(
          children: [
            FutureBuilder<dynamic>(
                future: fetchCountry(
                    request: widget.request,
                    selectedValue: widget.selectedValue),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length > 1) {
                      return MultiCountries(
                        countries: snapshot.data,
                        countryViewFromCountries:
                            widget.countryViewFromCountries,
                      );
                    }
                    if (snapshot.data.length == 0) {
                      return const Center(
                        heightFactor: 5,
                        child: Text('Country not found!',
                            style: TextStyle(fontSize: 24)),
                      );
                    }
                  }
                  return snapshot.hasData
                      ? SingleCountry(country: snapshot.data[0])
                      : const Center(
                          heightFactor: 5,
                          child: CircularProgressIndicator(),
                        );
                })
          ],
        ));
  }
}
