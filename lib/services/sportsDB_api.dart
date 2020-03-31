import 'package:http/http.dart' as http;
import 'package:sportsapp/models/league.dart';
import 'dart:convert' show json;

import 'package:sportsapp/models/sport.dart';
import 'package:sportsapp/models/team.dart';

class SportsDBApi {

  final _baseUrl = "https://thesportsdb.p.rapidapi.com/1/";
  String _allSports() => _baseUrl + "all_sports.php";
  String _allLeague(String name) => _baseUrl + "search_all_leagues.php?s=" + name;
  String _allTeamFromLeague(String id) => _baseUrl + "lookup_all_teams.php?id=" + id;

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

  Future<List<League>> fetchLeagues(String name) async {
    final List<dynamic> list = await request(_allLeague(name), "countrys");
    return list.map((json) => League.fromJson(json)).toList();
  }

  Future<List<Team>> fetchTeamsFromLeague(String id) async {
    final List<dynamic> list = await request(_allTeamFromLeague(id), "teams");
    return list.map((json) => Team.fromJson(json)).toList();
  }
}