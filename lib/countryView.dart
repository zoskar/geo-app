import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import './getCountry.dart';
import './multiCountries.dart';

class CountryView extends StatefulWidget {
  final String widgetTitle;
  final VoidCallback searchView;
  final Function countryViewFromCountries;
  final String request;
  final String selectedValue;


  const CountryView({Key? key, 
    required this.countryViewFromCountries,
    required this.searchView,
    required this.widgetTitle,
    required this.request,
    required this.selectedValue,
  }) : super(key: key);

  @override
  State<CountryView> createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  var formatter = NumberFormat('###,###,###');

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
                    request: widget.request, selectedValue: widget.selectedValue),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length > 1) {
                      return MultiCountries(
                        countries: snapshot.data,
                        countryViewFromCountries: widget.countryViewFromCountries,
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
                      ? Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                            ),
                            Text(
                              snapshot.data[0]['name']['common'],
                              style: const TextStyle(fontSize: 40),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Image.network(
                                  snapshot.data[0]['flags']['png'],
                                )),
                            const SizedBox(height: 30),
                            Text('Capital: ${snapshot.data[0]['capital'][0]}',
                                style: const TextStyle(fontSize: 24)),
                            const SizedBox(height: 15),
                            Text(
                              
                                'Population: ${formatter.format(snapshot.data[0]['population'])}',
                                style: const TextStyle(fontSize: 24)),
                            const SizedBox(height: 15),
                            Text('Area: ${snapshot.data[0]['area']} km2',
                                style: const TextStyle(fontSize: 24)),
                            const SizedBox(height: 15),
                            Text(
                                'Currency: ${snapshot.data[0]['currencies'].values.elementAt(0)['name']}',
                                style: const TextStyle(fontSize: 24)),
                            const SizedBox(height: 15),
                            Text('Region: ${snapshot.data[0]['region']}',
                                style: const TextStyle(fontSize: 24)),
                          ],
                        )
                      : const Center(
                          heightFactor: 5,
                          child: CircularProgressIndicator(),
                        );
                })
          ],
        ));
  }
}
