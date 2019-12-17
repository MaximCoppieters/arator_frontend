// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    senderUid: json['senderUid'] as String,
    receiverUid: json['receiverUid'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
  )..photoUrl = json['photoUrl'] as String;
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'senderUid': instance.senderUid,
      'receiverUid': instance.receiverUid,
      'type': instance.type,
      'message': instance.message,
      'photoUrl': instance.photoUrl,
    };
