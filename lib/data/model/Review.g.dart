// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return Review(
    json['rating'] as int,
    json['content'] as String,
    json['reviewer'] == null
        ? null
        : User.fromJson(json['reviewer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'content': instance.content,
      'rating': instance.rating,
      'reviewer': instance.reviewer,
    };
