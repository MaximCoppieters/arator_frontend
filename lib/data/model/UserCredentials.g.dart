// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserCredentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCredentials _$UserCredentialsFromJson(Map<String, dynamic> json) {
  return UserCredentials(
    email: json['email'] as String,
    password: json['password'] as String,
    confirmPassword: json['confirmPassword'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$UserCredentialsToJson(UserCredentials instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
