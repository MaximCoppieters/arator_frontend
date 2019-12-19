import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';

part 'Message.g.dart';

@JsonSerializable()
class Message implements Model {
  String senderUid;
  String receiverUid;
  String type;
  String message;
  String photoUrl;

  Message({this.senderUid, this.receiverUid, this.type, this.message});
  Message.withoutMessage(
      {this.senderUid, this.receiverUid, this.type, this.photoUrl});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
