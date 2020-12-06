import 'dart:convert';

import 'package:http/http.dart' as http;
 
class CepService {
  final _path = "https://viacep.com.br";

  Future search(String cep) async {
    final response = await http.get(
      "$_path/ws/$cep/json/",
       headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
    );
        
    return json.decode(response.body);
  }
}