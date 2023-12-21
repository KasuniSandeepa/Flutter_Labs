import 'dart:convert';
import 'package:http/http.dart';

class AgifyService {
  static const String endPoint = "https://api.agify.io";

  const AgifyService();

  Future<int?> getAgeFromName(String name) async {
    //get method is coming from http
    Response response = await get(Uri.parse(endPoint).replace(queryParameters: {
      'name': name,
    }));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['age'];
    }

    throw Exception("Error is getting the age");
  }
}
