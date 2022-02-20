import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleCountry extends StatelessWidget {
  var formatter = NumberFormat('###,###,###');
  var country;

  SingleCountry({required this.country});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
        ),
        Text(
          country['name']['common'],
          style: const TextStyle(fontSize: 40),
        ),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Image.network(
              country['flags']['png'],
            )),
        const SizedBox(height: 30),
        Text('Capital: ${country['capital'][0]}',
            style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 15),
        Text('Population: ${formatter.format(country['population'])}',
            style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 15),
        Text('Area: ${country['area']} km2',
            style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 15),
        Text('Currency: ${country['currencies'].values.elementAt(0)['name']}',
            style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 15),
        Text('Region: ${country['region']}',
            style: const TextStyle(fontSize: 24)),
      ],
    );
  }
}
