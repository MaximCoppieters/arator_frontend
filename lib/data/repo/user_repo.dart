import 'package:arator/data/AppStorage.dart';
import 'package:arator/data/model/AuthenticationDetails.dart';
import 'package:arator/data/model/User.dart';
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
  static final userEndpoint = "/user";

  final storage = new AppStorage();
  final httpClient = AppHttpClient();

  Future<String> authenticate({
    @required UserCredentials userCredentials,
  }) async {
    Map<String, dynamic> body =
        await _postAuthentication(userCredentials, loginEndpoint);

    return body["token"];
  }

  Future<void> register({
    @required UserCredentials userCredentials,
  }) async {
    await _postAuthentication(userCredentials, registerEndpoint);
  }

  Future<Map<String, dynamic>> _postAuthentication(
      UserCredentials credentials, String endpoint) async {
    var res = await httpClient.postJson(endpoint: endpoint, body: credentials);

    if (res.statusCode == 404) {
      throw new FormException(message: "Couldn't reach server");
    }

    // Succesful registry, no body required
    if (res.statusCode == 201) return null;

    var body = jsonDecode(res.body);
    if (res.statusCode != 200) {
      parseAndThrowException(body);
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

  Future<User> getUserDetails() async {
    var res = await httpClient.getJson(endpoint: userEndpoint);

    if (res.statusCode == 400) {
      throw Exception("User details not found");
    }

    return User.fromJson(jsonDecode(res.body));
  }
}
