import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:plakayorum_mobile/commons/url.dart';
import 'package:plakayorum_mobile/models/plaka.dart';
import 'package:http/http.dart' as http;
import 'package:plakayorum_mobile/models/yorum.dart';

class YorumService {
  final int _plakaId;

  YorumService(this._plakaId);

  Future<List<Yorum>> fetchYorumList() async {
    final response = await http.get(Url.YORUM_SERVICE + _plakaId.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      String body = utf8.decode(response.bodyBytes);
      final parsed = jsonDecode(body).cast<Map<String, dynamic>>();

      return parsed.map<Yorum>((json) => Yorum.fromJson(json)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
