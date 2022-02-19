import 'package:flutter/material.dart';

import './search.dart';
import './dropList.dart';

class SearchView extends StatelessWidget {
  String widgetTitle;
  String selectedValue;
  Function pickList;
  VoidCallback countryView;
  var myController;

  SearchView({
    required this.countryView,
    required this.pickList,
    required this.selectedValue,
    required this.widgetTitle,
    required this.myController,
  });

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
            FloatingActionButton(
              onPressed: countryView,
              child: Icon(Icons.arrow_forward_rounded),
            ),
          ],
        ));
  }
}
