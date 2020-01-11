import 'package:arator/data/AppStorage.dart';
import 'package:arator/data/model/User.dart';
import 'package:arator/data/model/UserAddress.dart';
import 'package:arator/data/model/UserCredentials.dart';
import 'package:arator/data/model/UserSettings.dart';
import 'package:arator/data/repo/repo.dart';
import 'package:arator/utils/app_http_client.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:arator/utils/exceptions/gps_exception.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart';

class UserRepository extends Repository {
  static final _registerEndpoint = "/signup";
  static final _loginEndpoint = "/login";
  static final _userEndpoint = "/user";
  static final _userSettingsEndpoint = "/user/settings";
  static final _userAddressEndpoint = "/user/address";

  final _storage = new AppStorage();
  final _httpClient = AppHttpClient();

  Future<String> authenticate({
    @required UserCredentials userCredentials,
  }) async {
    Map<String, dynamic> body =
        await _postAuthentication(userCredentials, _loginEndpoint);

    return body["token"];
  }

  Future<void> register({
    @required UserCredentials userCredentials,
  }) async {
    await _postAuthentication(userCredentials, _registerEndpoint);
  }

  Future<Map<String, dynamic>> _postAuthentication(
      UserCredentials credentials, String endpoint) async {
    BaseResponse res =
        await _httpClient.postJson(endpoint: endpoint, body: credentials);

    if (res.statusCode == 404) {
      throw new FormException(message: "Couldn't reach server");
    }

    // Succesful registry, no body required
    if (res.statusCode == 201) return null;

    var body = jsonDecode((res as Response).body);
    if (res.statusCode != 200) {
      parseAndThrowException(body);
    }
    return body;
  }

  Future<void> deleteToken() async {
    _storage.delete(key: AppStorageKey.JWT);
    return;
  }

  Future<void> persistToken(String token) async {
    _storage.write(key: AppStorageKey.JWT, value: token);
    return;
  }

  Future<bool> hasToken() async {
    var token = await _storage.get(key: AppStorageKey.JWT);
    return token != null && token.isNotEmpty;
  }

  Future<User> getUserDetails() async {
    BaseResponse res = await _httpClient.getJson(endpoint: _userEndpoint);

    if (res.statusCode == 400) {
      throw Exception("User details not found");
    }
    return User.fromJson(
        jsonDecode(await (res as StreamedResponse).stream.bytesToString()));
  }

  Future<void> updateUserSettings({
    @required UserSettings userSettings,
  }) async {
    var res = await _httpClient.putJson(
        endpoint: _userSettingsEndpoint, body: userSettings);

    if (res.statusCode != 200) {
      throw FormException(message: "Couldn't update user settings");
    }
  }

  Future<void> saveUserAddress(UserAddress address) async {
    var res = await _httpClient.postJson(
        endpoint: _userAddressEndpoint, body: address);

    if (res.statusCode != 201) {
      throw GpsException(message: "Address is not valid");
    }
  }
}
