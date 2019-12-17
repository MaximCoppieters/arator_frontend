// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    email: json['email'] as String,
    userName: json['userName'] as String,
    profileImagePath: json['profileImagePath'] as String,
    reviews: (json['reviews'] as List)
        .map((e) => Review.fromJson(e as Map<String, dynamic>))
        .toList(),
    address: Address.fromJson(json['address'] as Map<String, dynamic>),
    about: json['about'] as String,
  )
    ..description = json['description'] as String
    ..products = (json['products'] as List)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'userName': instance.userName,
      'profileImagePath': instance.profileImagePath,
      'description': instance.description,
      'address': instance.address,
      'about': instance.about,
      'products': instance.products,
      'reviews': instance.reviews,
    };
