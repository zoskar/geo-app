import 'package:flutter/material.dart';

import './search.dart';
import './getCountry.dart';
import './dropList.dart';

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
  Widget build(BuildContext context) {
    if (flag == 0) {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
            children: [
              Search(),
              DropList(
                selectedValue: _selectedValue,
                handler: _pickList,
              ),
              FloatingActionButton(
                onPressed: _countryView,
                child: Icon(Icons.arrow_forward_rounded),
              )
            ],
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            leading: IconButton(
              onPressed: _searchView,
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            children: [
              FutureBuilder<Country>(
                  future: fetchAlbum(),
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
    }
  }
}
