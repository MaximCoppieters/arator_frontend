import 'package:arator/data/AppStorage.dart';
import 'package:arator/data/model/UserCredentials.dart';
import 'package:arator/data/repo/repo.dart';
import 'package:arator/utils/app_http_client.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class UserRepository extends Repository {
  static final registerEndpoint = "/signup";
  static final loginEndpoint = "/login";
  static final jwtStorageKey = "arator_jwt";

  final storage = new AppStorage();
  final httpClient = AppHttpClient();

  Future<String> authenticate({
    @required UserCredentials userCredentials,
  }) async {
    Map<String, dynamic> body =
        await postAuthenticationJsonResponse(userCredentials, loginEndpoint);

    var token = body["token"];

    return token;
  }

  Future<void> register({
    @required UserCredentials userCredentials,
  }) async {
    await postAuthenticationJsonResponse(userCredentials, registerEndpoint);
  }

  Future<Map<String, dynamic>> postAuthenticationJsonResponse(
      UserCredentials credentials, String endpoint) async {
    var res = await httpClient.postJson(endpoint: endpoint, body: credentials);

    if (res.statusCode == 404) {
      throw new FormException(message: "Couldn't reach server");
    }

    // Succesful registry, no body required
    if (res.statusCode == 201) return null;

    var body = jsonDecode(res.body);
    if (res.statusCode != 200) {
      throw new FormException();
    }
    return body;
  }

  Future<void> deleteToken() async {
    storage.delete(key: AppStorageKey.JWT);
    return;
  }

  Future<void> persistToken(String token) async {
    storage.write(key: AppStorageKey.JWT, value: token);
    return;
  }

  Future<bool> hasToken() async {
    var token = await storage.get(key: AppStorageKey.JWT);
    return token != null && token.isNotEmpty;
  }
}
