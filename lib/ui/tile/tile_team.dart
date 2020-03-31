import 'package:flutter/material.dart';
import 'package:sportsapp/models/team.dart';
import 'package:sportsapp/ui/widgets/icon_widget.dart';

class TileTeam extends StatelessWidget {
  final Team team;
  TileTeam(this.team);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(team.name),
      leading: IconWidget(url: team.images.badge, size: 40),
    );

  }
}