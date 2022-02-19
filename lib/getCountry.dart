import 'dart:async';
import 'dart:convert';

import 'package:geoapp/main.dart';
import 'package:http/http.dart' as http;

Future<dynamic> fetchCountry(
    {required String selectedValue, required String request}) async {
  String link = getLink(choice: selectedValue, request: request);

  var response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
    return decodedResponse;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return [];
  }
}

String getLink({required String choice, required String request}) {
  if (choice == 'By continent') {
    return 'https://restcountries.com/v3.1/region/$request';
  } else if (choice == 'By currency') {
    return 'https://restcountries.com/v3.1/currency/$request';
  } else if (choice == 'By capital') {
    return 'https://restcountries.com/v3.1/capital/$request';
  } else {
    return 'https://restcountries.com/v3.1/name/$request';
  }
}

class Country {
  String name;
  final String capital;
  final int population;
  final double area;
  final String currency;
  final String subregion;
  final String flagLink;

  Country(
      {required this.name,
      required this.capital,
      required this.population,
      required this.area,
      required this.currency,
      required this.subregion,
      required this.flagLink});

  // factory Country.fromJson(Map<String, dynamic> json) {
  //   return Country(name: json['name'], capital: json['capital'], population: json['population']);
  // }
}
