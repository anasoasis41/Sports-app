import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/blocs/bloc_provider.dart';
import 'package:sportsapp/blocs/bloc_team.dart';
import 'package:sportsapp/models/league.dart';
import 'package:sportsapp/models/team.dart';
import 'package:sportsapp/ui/lists/list_team.dart';
import 'package:sportsapp/ui/widgets/my_app_bar.dart';
import 'package:sportsapp/ui/widgets/no_data.dart';

class LeagueScreen extends StatelessWidget {
  final League league;
  LeagueScreen(this.league);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocTeam>(context);
    final midHeight = MediaQuery.of(context).size.height / 2.5;
    return Scaffold(
      appBar: MyAppBar(titleString: league.name),
      body: Column(
        children: <Widget>[
          detail(midHeight),
          Expanded(
            child: StreamBuilder<List<Team>>(
              stream: bloc.stream,
              builder: (context, snapshot) {
                if (snapshot == null) {
                  return NoData("Aucune données");
                } else if (!snapshot.hasData) {
                  return NoData("N'a pas de données");
                } else {
                  return ListTeam(snapshot.data);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Container detail(double height) {
    return Container(
      height: height,
      child: Card(
        elevation: 7.5,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: league.images.badge,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(league.description.english),
              ),
            ],
          ),
        ),
      ),
    );
  }
}