// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticationDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationDetails _$AuthenticationDetailsFromJson(
    Map<String, dynamic> json) {
  return AuthenticationDetails(
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['token'] as String,
  );
}

Map<String, dynamic> _$AuthenticationDetailsToJson(
        AuthenticationDetails instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
