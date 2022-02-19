import 'package:flutter/material.dart';

import './search.dart';
import './dropList.dart';

class SearchView extends StatelessWidget {
  final String widgetTitle;
  final String selectedValue;
  final Function pickList;
  final VoidCallback countryView;
  final myController;
  final List<dynamic> countries = [];

  SearchView({Key? key, 
    required this.countryView,
    required this.pickList,
    required this.selectedValue,
    required this.widgetTitle,
    required this.myController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widgetTitle),
        ),
        body: Column(
          children: [
            Search(
              myController: myController,
            ),
            DropList(
              selectedValue: selectedValue,
              handler: pickList,
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: FloatingActionButton(
                onPressed: countryView,
                child: const Icon(Icons.arrow_forward_rounded),
              ),
            ),
          ],
        ));
  }
}
