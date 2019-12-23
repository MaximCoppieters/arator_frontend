import 'dart:convert';
import 'dart:io';

import 'package:arator/app.dart';
import 'package:arator/data/AppStorage.dart';
import 'package:arator/data/model/Model.dart';
import 'package:arator/data/model/Product.dart';
import 'package:http/http.dart';

class AppHttpClient {
  final _storage = new AppStorage();
  final String _baseUrl = AppInfo.apiBaseUrl;
  static final appJson = "application/json";

  Future<StreamedResponse> postProduct({String endpoint, Product body}) async {
    var jwtToken = await _storage.get(key: AppStorageKey.JWT);
    var req = MultipartRequest("POST", Uri.parse(_baseUrl + endpoint));
    req.headers
        .addAll({HttpHeaders.authorizationHeader: bearerJwtToken(jwtToken)});
    body.toJson().forEach((String field, dynamic value) => {
          if (field != "image") {req.fields[field] = value.toString()}
        });

    if (body.image != null) {
      req.files.add(await MultipartFile.fromPath("image", body.image.path));
    }
    var res = await req.send();

    return res;
  }

  Future<Response> postJson({String endpoint, Model body}) async {
    var jwtToken = await _storage.get(key: AppStorageKey.JWT);
    var requestHeaders = {HttpHeaders.contentTypeHeader: appJson};
    if (jwtToken != null) {
      requestHeaders[HttpHeaders.authorizationHeader] = jwtToken;
    }
    var res;
    try {
      res = await post(_baseUrl + endpoint,
          headers: requestHeaders, body: json.encode(body.toJson()));
    } catch (err) {
      print(err);
      res = Response("", 404);
    }

    return res;
  }

  Future<Response> getJson({String endpoint}) async {
    var jwtToken = await _storage.get(key: AppStorageKey.JWT);

    var res = await get(_baseUrl + endpoint, headers: {
      HttpHeaders.contentTypeHeader: appJson,
      HttpHeaders.authorizationHeader: bearerJwtToken(jwtToken)
    });

    return res;
  }

  String bearerJwtToken(jwtToken) {
    return "Bearer " + jwtToken;
  }
}
