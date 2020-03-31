import 'package:flutter/material.dart';
import 'package:sportsapp/models/team.dart';
import 'package:sportsapp/ui/tile/tile_team.dart';

class ListTeam extends StatelessWidget {
  final List<Team> teams;
  ListTeam(this.teams);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, i) => TileTeam(teams[i]),
        separatorBuilder: (ctx, i) => Divider(),
        itemCount: teams.length
    );

  }
}