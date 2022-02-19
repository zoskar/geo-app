import 'package:flutter/material.dart';

import './getCountry.dart';
import './multiCountries.dart';

class CountryView extends StatelessWidget {
  String widgetTitle;
  VoidCallback searchView;
  Function countryViewFromCountries;
  String request;
  String selectedValue;

  CountryView({
    required this.countryViewFromCountries,
    required this.searchView,
    required this.widgetTitle,
    required this.request,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widgetTitle),
          leading: IconButton(
            onPressed: searchView,
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            FutureBuilder<dynamic>(
                future: fetchCountry(
                    request: request, selectedValue: selectedValue),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length > 1) {
                      return MultiCountries(
                        countries: snapshot.data,
                        countryViewFromCountries: countryViewFromCountries,
                      );
                    }
                    if (snapshot.data.length == 0) {
                      return Center(
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
                              margin: EdgeInsets.all(10),
                            ),
                            Text(
                              snapshot.data[0]['name']['common'],
                              style: TextStyle(fontSize: 40),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Image.network(
                                  snapshot.data[0]['flags']['png'],
                                )),
                            SizedBox(height: 30),
                            Text('Capital: ${snapshot.data[0]['capital'][0]}',
                                style: TextStyle(fontSize: 24)),
                            SizedBox(height: 15),
                            Text(
                                'Population: ${snapshot.data[0]['population']}',
                                style: TextStyle(fontSize: 24)),
                            SizedBox(height: 15),
                            Text('Area: ${snapshot.data[0]['area']}',
                                style: TextStyle(fontSize: 24)),
                            SizedBox(height: 15),
                            Text(
                                'Currency: ${snapshot.data[0]['currencies'].values.elementAt(0)['name']}',
                                style: TextStyle(fontSize: 24)),
                            SizedBox(height: 15),
                            Text('Region: ${snapshot.data[0]['region']}',
                                style: TextStyle(fontSize: 24)),
                          ],
                        )
                      : Center(
                          heightFactor: 5,
                          child: CircularProgressIndicator(),
                        );
                })
          ],
        ));
  }
}
