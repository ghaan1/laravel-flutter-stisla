import 'package:http/http.dart';

class HttpHelper{
  final String _baseUrl = 'http://192.168.1.5:8000/api/auth/';


Future<Response> login(String email, String password, String deviceId) async {
  final url = Uri.parse(_baseUrl + 'login');
  final body = {
    'email' : email,
    'password' : password,
    'device_name' : deviceId
  };
  final headers = {
    'Accept': 'application/json',
  };
  final response = await post(url, body: body, headers: headers);
  return response;
}

Future<Response> logout(String token) async {
  final url = Uri.parse(_baseUrl + 'login');
  final body = {
    'token' : token,
  };
  final headers = {
    'Accept': 'application/json',
  };
  final response = await post(url, body: body, headers: headers);
  return response;
}

//  _save(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'token';
//     final value = token;
//     prefs.setString(key, value);
//   }


//  read() async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'token';
//     final value = prefs.get(key ) ?? 0;
//     print('read : $value');
//   }
}