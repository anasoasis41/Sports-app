import 'package:flutter/material.dart';
import 'package:sportsapp/models/league.dart';
import 'package:sportsapp/ui/tile/tile_league.dart';

class ListLeague extends StatelessWidget {
  final List<League> leagues;
  ListLeague(this.leagues);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, i) => TileLeague(leagues[i]),
        separatorBuilder: (ctx, i) => Divider(),
        itemCount: leagues.length
    );
  }
}