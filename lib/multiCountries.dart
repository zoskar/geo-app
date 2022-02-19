import 'package:flutter/material.dart';

import 'countryView.dart';

class MultiCountries extends StatelessWidget {
  List<dynamic> countries;
  Function countryViewFromCountries;

  List<Widget> list = [];
  List<Widget> rows = [];
  double margin = 20;

  MultiCountries(
      {required this.countries, required this.countryViewFromCountries});

  @override
  Widget build(BuildContext context) {
    for (var country in countries) {
      list.add(Container(
        height: 131,
        margin: EdgeInsets.all(margin),
        width: (MediaQuery.of(context).size.width) / 2 - 2 * margin,
        //decoration: BoxDecoration(border: Border.all()),
        child: TextButton(
          onPressed: () => countryViewFromCountries(country['name']['common']),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Image.network(
                  country['flags']['png'],
                ),
              ),
              Text(country['name']['common'])
            ],
          ),
        ),
      ));
    }
    bool even = ((list.length / 2) % 2 == 0);
    for (var i = 0; i < list.length-1; i += 2) {
      rows.add(Row(
        children: [list[i], list[i + 1]],
      ));
    }
    if (!even) {
      rows.add(Row(
        children: [list.last],
      ));
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: [for (var row in rows) row]),
        //children: [for (var row in rows) row],
      ),
    );
  }
}
