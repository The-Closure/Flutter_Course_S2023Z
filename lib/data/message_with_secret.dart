// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MessageWithSecret {
  String secretcode;
  String message;
  MessageWithSecret({
    required this.secretcode,
    required this.message,
  });

  MessageWithSecret copyWith({
    String? secretcode,
    String? message,
  }) {
    return MessageWithSecret(
      secretcode: secretcode ?? this.secretcode,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'secretcode': secretcode,
      'message': message,
    };
  }

  factory MessageWithSecret.fromMap(Map<String, dynamic> map) {
    return MessageWithSecret(
      secretcode: map['secretcode'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageWithSecret.fromJson(String source) => MessageWithSecret.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MessageWithSecret(secretcode: $secretcode, message: $message)';

  @override
  bool operator ==(covariant MessageWithSecret other) {
    if (identical(this, other)) return true;
  
    return 
      other.secretcode == secretcode &&
      other.message == message;
  }

  @override
  int get hashCode => secretcode.hashCode ^ message.hashCode;
}
