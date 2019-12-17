import 'package:json_annotation/json_annotation.dart';

part 'Message.g.dart';

@JsonSerializable(nullable: false)
class Message {
  String senderUid;
  String receiverUid;
  String type;
  String message;
  String photoUrl;

  Message({this.senderUid, this.receiverUid, this.type, this.message});
  Message.withoutMessage(
      {this.senderUid, this.receiverUid, this.type, this.photoUrl});

  Map toMap() {
    var map = Map<String, dynamic>();
    map['senderUid'] = this.senderUid;
    map['receiverUid'] = this.receiverUid;
    map['type'] = this.type;
    map['message'] = this.message;
    return map;
  }

  Message fromMap(Map<String, dynamic> map) {
    Message _message = Message();
    _message.senderUid = map['senderUid'];
    _message.receiverUid = map['receiverUid'];
    _message.type = map['type'];
    _message.message = map['message'];
    return _message;
  }

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
