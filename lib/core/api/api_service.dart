import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String url = "https://api.npoint.io/e728bb91e0cd56cc0711/";

  Future<Map<String, dynamic>> fetchData() async {

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Erro ao carregar dados");
    }
  }
}
