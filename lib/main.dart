import 'package:flutter/material.dart';

import './search.dart';
import './getData.dart';

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
  final _items = ['By name', 'By continent', 'By currency', 'By capital'];
  var _selectedValue = 'By name';
  int flag = 0;

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

  void initState() {
    super.initState();
    var country = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: flag == 0
            ? Column(
                children: [
                  search(),
                  newMethod(),
                  FloatingActionButton(
                      onPressed: _countryView,
                      child: Icon(Icons.arrow_forward_rounded))
                ],
              )
            : Column(
                children: [
                  FutureBuilder<Country>(
                      future: fetchAlbum(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        FloatingActionButton(
                                          onPressed: null,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      })
                ],
              ));
  }

  DropdownButton<String> newMethod() {
    return DropdownButton<String>(
                  value: _selectedValue,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurple,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue!;
                    });
                  },
                  items: _items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
  }
}
