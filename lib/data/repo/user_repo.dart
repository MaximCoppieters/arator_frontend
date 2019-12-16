import 'dart:io';

import 'package:arator/data/UserCredentials.dart';
import 'package:arator/data/repo/repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import '../Address.dart';
import '../Review.dart';
import '../User.dart';

class UserRepository extends Repository {
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
    var res = await http.post(baseUrl + "/login",
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: json.encode(userCredentials.toJson()));

    if (res.statusCode != 200) {
      throw new HttpException("Haha");
    }

    var body = jsonDecode(res.body);

    var token = body["token"];

    return token;
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
