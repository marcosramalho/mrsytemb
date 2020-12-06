import 'dart:convert';

import 'package:http/http.dart' as http;
 
class AuthService {
  final _path = "http://10.0.0.248:8000/auth";
  
  Future createAccount(var account) async {
     final response = await http.post(
      "$_path/signup",
       headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
      body: json.encode(account),
    );
            
    return response.statusCode;
  }
}