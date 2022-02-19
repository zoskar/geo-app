import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Country> fetchCountry(
    {required String selectedValue, required String request}) async {
  String link = getLink(choice: selectedValue, request: request);

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
        subregion: decodedResponse[0]['region'],
        flagLink: decodedResponse[0]['flags']['png']);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Country');
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
