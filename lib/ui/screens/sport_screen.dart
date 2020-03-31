import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/models/sport.dart';
import 'package:sportsapp/ui/screens/tabs/tab_sport_description.dart';
import 'package:sportsapp/ui/screens/tabs/tab_sport_leagues.dart';

class SportScreen extends StatelessWidget {
  final Sport sport;
  SportScreen(this.sport);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(sport.name),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.info), text: "Desription",),
              Tab(icon: Icon(Icons.list), text: "Leagues",)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            TabSportDescription(sport),
            TabSportLeagues()
          ],
        )
      ),
    );
  }
}