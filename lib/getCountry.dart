import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Country> fetchCountry(
    {String link = 'https://restcountries.com/v3.1/name/poland)'}) async {
  var response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    return Country(
        name: decodedResponse[0]['name']['common'],
        capital: decodedResponse[0]['capital'][0],
        population: decodedResponse[0]['population'],
        area: decodedResponse[0]['area'],
        currency: decodedResponse[0]['currencies'].values.elementAt(0)['name'],
        subregion: decodedResponse[0]['subregion'],
        flagLink: decodedResponse[0]['flags']['png']);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Country');
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
