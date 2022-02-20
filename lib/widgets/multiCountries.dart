import 'package:flutter/material.dart';

class MultiCountries extends StatelessWidget {
  List<dynamic> countries;
  Function countryViewFromCountries;

  List<Widget> list = [];
  List<Widget> rows = [];
  double margin = 20;

  MultiCountries(
      {Key? key,
      required this.countries,
      required this.countryViewFromCountries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    for (var country in countries) {
      list.add(Container(
        margin: EdgeInsets.all(margin),
        width: (MediaQuery.of(context).size.width) / 2 - 2 * margin,
        //decoration: BoxDecoration(border: Border.all()),
        child: TextButton(
          onPressed: () => countryViewFromCountries(country),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Image.network(
                  country['flags']['png'],
                ),
              ),
              Text(
                country['name']['common'],
                style: const TextStyle(fontSize: 18, color: Colors.black),
              )
            ],
          ),
        ),
      ));
    }
    bool even = ((list.length) % 2 == 0);
    for (var i = 0; i < list.length - 1; i += 2) {
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
