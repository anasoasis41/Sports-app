import 'package:http/http.dart' as http;
import 'dart:convert' show json;

import 'package:sportsapp/models/sport.dart';

class SportsDBApi {

  final _baseUrl = "https://thesportsdb.p.rapidapi.com/1/";
  String _allSports() => _baseUrl + "all_sports.php";
  String _allLeague(String name) => _baseUrl + "search_all_leagues.php?s=" + name;

  Map<String, String> get headers => {
    "x-rapidapi-host": "thesportsdb.p.rapidapi.com",
    "x-rapidapi-key": "2655035405msh15a8e154e83e50dp1e2111jsn77f45a3694f2"
  };

  Future<List<dynamic>> request(String urlString, String key) async {
    final result = await http.get(urlString, headers: headers);
    final body = json.decode(result.body);
    return body[key];
  }

  Future<List<Sport>> fetchSports() async {
    final List<dynamic> list = await request(_allSports(), "sports");
    return list.map((json) => Sport.fromJson(json)).toList();
  }
}