import 'dart:convert';
import 'dart:io';

import 'package:arator/app.dart';
import 'package:arator/data/AppStorage.dart';
import 'package:arator/data/model/Model.dart';
import 'package:http/http.dart';

class AppHttpClient {
  final _storage = new AppStorage();
  final String _baseUrl = AppInfo.apiBaseUrl;
  static final appJson = "application/json";

  Future<Response> postJson({String endpoint, Model body}) async {
    var jwtToken = await _storage.get(key: AppStorageKey.JWT);
    var res = await post(_baseUrl + endpoint,
        headers: {
          HttpHeaders.contentTypeHeader: appJson,
          "Authorization": "Bearer " + jwtToken
        },
        body: json.encode(body.toJson()));

    return res;
  }

  Future<Response> getJson({String endpoint}) async {
    var jwtToken = await _storage.get(key: AppStorageKey.JWT);

    var res = await get(_baseUrl + endpoint, headers: {
      HttpHeaders.contentTypeHeader: appJson,
      HttpHeaders.authorizationHeader: "bearer " + jwtToken
    });

    return res;
  }
}
