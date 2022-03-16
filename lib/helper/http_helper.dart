import 'dart:convert';
import 'package:bdexclusive/model/UserModel.dart';
import 'package:bdexclusive/model/user_payload.dart';
import 'constant.dart';
import 'package:http/http.dart' as http;




Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
};

Future<http.Response> signUp(User user) async {
  final response = await http.post(Uri.parse(registerApi),
      headers: requestHeaders, body: jsonEncode(user.toMap()));

  return response;
}

Future<http.Response> signIn(UserPayload userPayload) async {
  final response = await http.post(Uri.parse(loginApi),
      headers: requestHeaders, body: jsonEncode(userPayload.toMap()));
  return response;

}


Future<http.Response> productShowById(String id) async {
  final response = await http
      .get(Uri.parse(getProductByIdApi + id));
  return  response;

}
