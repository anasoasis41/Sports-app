import 'package:flutter/material.dart';
import 'package:sportsapp/blocs/bloc_router.dart';
import 'package:sportsapp/models/league.dart';
import 'package:sportsapp/ui/widgets/icon_widget.dart';

class TileLeague extends StatelessWidget {
  final League league;
  TileLeague(this.league);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(league.name),
      leading: IconWidget(url: league.images.badge, size: 40),
      onTap: () => Navigator.of(context).push(BlocRouter().leagueDetail(league)),
    );
  }
}