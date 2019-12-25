// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['_id'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
    profileImageUrl: json['profileImageUrl'] as String,
    reviews: (json['reviews'] as List)
        ?.map((e) =>
            e == null ? null : Review.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reviewCount: json['reviewCount'] as num,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    about: json['about'] as String,
    userSettings: json['userSettings'] == null
        ? null
        : UserSettings.fromJson(json['userSettings'] as Map<String, dynamic>),
  )
    ..ratingCount = json['ratingCount'] as num
    ..averageRating = json['averageRating'] as num
    ..products = (json['products'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..reviewAverage = json['reviewAverage'] as num;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'address': instance.address,
      'about': instance.about,
      'ratingCount': instance.ratingCount,
      'averageRating': instance.averageRating,
      'products': instance.products,
      'reviews': instance.reviews,
      'reviewCount': instance.reviewCount,
      'reviewAverage': instance.reviewAverage,
      'userSettings': instance.userSettings,
    };
