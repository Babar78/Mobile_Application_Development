import 'package:store_data/models/search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Search>> fetchSearchData() async {
  final response = await http
      .get(Uri.parse('https://codewithandrea.com/search/search.json'));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List<dynamic> results = jsonResponse['results'];
    return results.map((json) => Search.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load search data');
  }
}
