import 'dart:io';

import 'package:arator/data/UserCredentials.dart';
import 'package:arator/data/repo/repo.dart';
import 'package:arator/utils/exceptions/authentication_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/Address.dart';
import '../model/Review.dart';
import '../model/User.dart';

class UserRepository extends Repository {
  static final registerEndpoint = "/signup";
  static final loginEndpoint = "/login";
  static final jwtStorageKey = "arator_jwt";

  final storage = new FlutterSecureStorage();

  Future<User> getUserWithCredentials(UserCredentials credentials) async {
    return Future.delayed(Duration(seconds: 1), () {
      return new User(
        email: credentials.email,
        userName: "Pedro Fernandez",
        profileImagePath: "assets/images/pedro.png",
        about: "Lorem ipsum dolor amani heala azpkada dspqdqs",
        reviews: [
          new Review(
              4,
              "Great products, thanks",
              User(
                  userName: "Enrico",
                  profileImagePath: "assets/images/pedro.png")),
        ],
        address: Address(
            street: "Daalhofstraat",
            number: "5c",
            postalCode: "3840",
            country: "Belgium"),
      );
    });
  }

  Future<String> authenticate({
    @required UserCredentials userCredentials,
  }) async {
    Map<String, dynamic> body = await getAuthenticationJsonResponseFromEndpoint(
        userCredentials, loginEndpoint);

    var token = body["token"];

    return token;
  }

  Future<void> register({
    @required UserCredentials userCredentials,
  }) async {
    await getAuthenticationJsonResponseFromEndpoint(
        userCredentials, registerEndpoint);
  }

  Future<Map<String, dynamic>> getAuthenticationJsonResponseFromEndpoint(
      UserCredentials credentials, String endpoint) async {
    var res = await http.post(baseUrl + endpoint,
        headers: {HttpHeaders.contentTypeHeader: Repository.appJson},
        body: json.encode(credentials.toJson()));

    if (res.statusCode == 404) {
      throw new AuthenticationException("Couldn't reach server");
    }

    // Succesful registry, no body required
    if (res.statusCode == 201) return null;

    var body = jsonDecode(res.body);
    if (res.statusCode != 200) {
      print("thrown");
      throw new AuthenticationException.fromResponseBody(body);
    }
    return body;
  }

  Future<void> deleteToken() async {
    storage.delete(key: jwtStorageKey);
    return;
  }

  Future<void> persistToken(String token) async {
    storage.write(key: jwtStorageKey, value: token);
    return;
  }

  Future<bool> hasToken() async {
    var token = await storage.read(key: jwtStorageKey);
    return token != null && token.isNotEmpty;
  }
}
