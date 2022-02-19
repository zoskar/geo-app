import 'package:flutter/material.dart';

import './getCountry.dart';

class CountryView extends StatelessWidget {
  String widgetTitle;
  VoidCallback searchView;
  String request;
  String selectedValue;

  CountryView({
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
            FutureBuilder<Country>(
                future: fetchCountry(
                    request: request, selectedValue: selectedValue),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                            ),
                            Text(
                              snapshot.data!.name,
                              style: TextStyle(fontSize: 40),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Image.network(
                                  snapshot.data!.flagLink,
                                )),
                            SizedBox(height: 30),
                            Text('Capital: ${snapshot.data!.capital}',
                                style: TextStyle(fontSize: 24)),
                            SizedBox(height: 15),
                            Text('Population: ${snapshot.data!.population}',
                                style: TextStyle(fontSize: 24)),
                            SizedBox(height: 15),
                            Text('Area: ${snapshot.data!.area}',
                                style: TextStyle(fontSize: 24)),
                            SizedBox(height: 15),
                            Text('Currency: ${snapshot.data!.currency}',
                                style: TextStyle(fontSize: 24)),
                            SizedBox(height: 15),
                            Text('Region: ${snapshot.data!.subregion}',
                                style: TextStyle(fontSize: 24)),
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                })
          ],
        ));
    throw UnimplementedError();
  }
}
