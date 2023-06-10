
import 'package:dio/dio.dart';

import '../data/user_model/user_model.dart';

login (User userdata)async{
  Dio req  = Dio();

  Response respone =await req.post('http://localhost:8080/api/login',data: userdata);

  if (respone.statusCode ==200){
    return respone ;
  }

  else return 'error';
}