import 'package:flutter/material.dart';
import 'package:sportsapp/blocs/bloc_sport.dart';
import 'package:sportsapp/blocs/bloc_team.dart';
import 'package:sportsapp/models/league.dart';
import 'package:sportsapp/models/sport.dart';
import 'package:sportsapp/ui/screens/home_screen.dart';
import 'package:sportsapp/ui/screens/sport_screen.dart';
import 'package:sportsapp/ui/screens/league_screen.dart';

import 'bloc_league.dart';
import 'bloc_provider.dart';

class BlocRouter {
  MaterialPageRoute sportDetail(Sport s) =>
      MaterialPageRoute(builder: (ctx) => sport(s));
  
  MaterialPageRoute leagueDetail(League l) => 
      MaterialPageRoute(builder: (ctx) => league(l));

  BlocProvider allSport() =>
      BlocProvider<BlocSport>(bloc: BlocSport(), child: HomeScreen());

  BlocProvider sport(Sport sport) =>
      BlocProvider<BlocLeague>(bloc: BlocLeague(sport.name), child: SportScreen(sport));

  BlocProvider league(League league) =>
      BlocProvider<BlocTeam>(bloc: BlocTeam(league.id), child: LeagueScreen(league));
}