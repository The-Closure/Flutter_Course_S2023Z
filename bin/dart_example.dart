// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:dio/dio.dart';

void main()  async {

// Dio TackWithBackEnd = Dio();

// Response response =  await TackWithBackEnd.get('https://jsonplaceholder.typicode.com/posts/1');

// // JsonPlaceHolder TheDataOfResponse = JsonPlaceHolder(userId: response.data['userId'], id:response.data['id'] , title: response.data['title'], body: response.data['body']);


//   JsonPlaceHolder TheData = JsonPlaceHolder.fromMap(response.data);

// if(response.statusCode ==200)

// print(TheData.body);

// else print("There is No Connection");


Dio CreateTest = Dio();

Response response1 = await CreateTest.post('http://localhost:8080/api/login',data:{
    "username":"abdalaziz",
    "password":"1234",
    "message":"test"
} );

print(response1.data);



  

}

class JsonPlaceHolder {
int userId;
int id;
String title;
String body;
  JsonPlaceHolder({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });


  JsonPlaceHolder copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return JsonPlaceHolder(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory JsonPlaceHolder.fromMap(Map<String, dynamic> map) {
    return JsonPlaceHolder(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JsonPlaceHolder.fromJson(String source) => JsonPlaceHolder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'JsonPlaceHolder(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant JsonPlaceHolder other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.id == id &&
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      body.hashCode;
  }
}
