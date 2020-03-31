import 'dart:async';

import 'package:sportsapp/blocs/bloc.dart';
import 'package:sportsapp/models/team.dart';
import 'package:sportsapp/services/sportsDB_api.dart';

class BlocTeam extends Bloc {
  final _streamController = StreamController<List<Team>>();
  Stream<List<Team>> get stream => _streamController.stream;
  Sink<List<Team>> get sink => _streamController.sink;

  BlocTeam(String id) {
    fetchTeams(id);
  }

  fetchTeams(String idTeam) async {
    final teams = await SportsDBApi().fetchTeamsFromLeague(idTeam);
    sink.add(teams);
  }

  @override
  dispose() => _streamController.close();

}