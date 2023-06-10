// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {


  String usrename;
  String password;
  String message;
  User({
    required this.usrename,
    required this.password,
    required this.message,
  });

  User copyWith({
    String? usrename,
    String? password,
    String? message,
  }) {
    return User(
      usrename: usrename ?? this.usrename,
      password: password ?? this.password,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'usrename': usrename,
      'password': password,
      'message': message,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      usrename: map['usrename'] as String,
      password: map['password'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(usrename: $usrename, password: $password, message: $message)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.usrename == usrename &&
      other.password == password &&
      other.message == message;
  }

  @override
  int get hashCode => usrename.hashCode ^ password.hashCode ^ message.hashCode;
}
