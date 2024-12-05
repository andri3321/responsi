import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/amiibo.dart';

class ApiService {
  static const String _baseUrl = 'https://www.amiiboapi.com/api/amiibo/';

  static Future<List<Amiibo>> fetchAmiibos() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['amiibo'];
      return data.map((amiibo) => Amiibo.fromJson(amiibo)).toList();
    } else {
      throw Exception('Failed to load amiibo data');
    }
  }
}
