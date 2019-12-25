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
        .addAll({HttpHeaders.authorizationHeader: _bearerJwtToken(jwtToken)});
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
    var postRequest = post(_fullApiUrl(endpoint),
        headers: await _jsonHeaders(), body: json.encode(body.toJson()));
    return _trySendRequest(postRequest);
  }

  Future<Response> putJson({String endpoint, Model body}) async {
    var putRequest = put(_fullApiUrl(endpoint),
        headers: await _jsonHeaders(), body: json.encode(body.toJson()));
    return _trySendRequest(putRequest);
  }

  Future<Response> getJson({String endpoint}) async {
    var getRequest = get(_fullApiUrl(endpoint), headers: await _jsonHeaders());
    return _trySendRequest(getRequest);
  }

  _fullApiUrl(String endpoint) {
    return _baseUrl + endpoint;
  }

  Future<Response> _trySendRequest(Future<Response> request) async {
    try {
      return await request;
    } catch (err) {
      return Response("Server not found", 404);
    }
  }

  Future<Map<String, String>> _jsonHeaders() async {
    var jwtToken = await _storage.get(key: AppStorageKey.JWT);
    var requestHeaders = {HttpHeaders.contentTypeHeader: appJson};
    if (jwtToken != null) {
      requestHeaders[HttpHeaders.authorizationHeader] =
          _bearerJwtToken(jwtToken);
    }
    return requestHeaders;
  }

  String _bearerJwtToken(jwtToken) {
    return "Bearer " + jwtToken;
  }
}
