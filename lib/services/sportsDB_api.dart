import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class SportsDBApi {

  final _baseUrl = "https://thesportsdb.p.rapidapi.com/1/";
  String _allSports() => _baseUrl + "all_sports.php";

  Map<String, String> get headers => {
    "x-rapidapi-host": "thesportsdb.p.rapidapi.com",
    "x-rapidapi-key": "2655035405msh15a8e154e83e50dp1e2111jsn77f45a3694f2"
  };

  Future<List<dynamic>> request(String urlString, String key) async {
    final result = await http.get(urlString, headers: headers);
    final body = json.decode(result.body);
    return body[key];
  }

  fetchSports() async {
    final List<dynamic> list = await request(_allSports(), "sports");
    list.forEach((l) {
      print("Nouvel élément: $l");
    });
  }
}