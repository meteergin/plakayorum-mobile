import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:plakayorum_mobile/commons/url.dart';
import 'package:plakayorum_mobile/models/plaka.dart';
import 'package:http/http.dart' as http;

class PlakaService {

  final String _plakaNo;

  PlakaService(this._plakaNo);

  Future<Plaka> plakaGetir(http.Client client) async {
    final response =
        await client.get(Url.PLAKA_SERVICE + _plakaNo);
    return compute(parsePlaka, response.body);
  }

  Future<Plaka> fetchPlaka() async {
    final response = await http.get(Url.PLAKA_SERVICE + _plakaNo);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Plaka.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

Plaka parsePlaka(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Plaka>((json) => Plaka.fromJson(json));
}
