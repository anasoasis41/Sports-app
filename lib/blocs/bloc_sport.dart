import 'dart:async';

import 'package:sportsapp/models/sport.dart';
import 'package:sportsapp/services/sportsDB_api.dart';

import 'bloc.dart';

class BlocSport extends Bloc {
  final _streamController = StreamController<List<Sport>>();
  Stream<List<Sport>> get stream => _streamController.stream;
  Sink<List<Sport>> get sink => _streamController.sink;

  BlocSport() {
    fetchSport();
  }

  fetchSport() async {
    final sports = await SportsDBApi().fetchSports();
    sink.add(sports);
  }

  @override
  dispose() => _streamController.close();

}