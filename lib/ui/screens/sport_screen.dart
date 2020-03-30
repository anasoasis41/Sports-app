import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/blocs/bloc_league.dart';
import 'package:sportsapp/blocs/bloc_provider.dart';
import 'package:sportsapp/models/league.dart';
import 'package:sportsapp/models/sport.dart';
import 'package:sportsapp/ui/widgets/my_app_bar.dart';
import 'package:sportsapp/ui/widgets/no_data.dart';

class SportScreen extends StatelessWidget {
  final Sport sport;
  SportScreen(this.sport);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocLeague>(context);
    final midHeight = MediaQuery.of(context).size.height / 2.5;
    return Scaffold(
      appBar: MyAppBar(titleString: sport.name),
      body: Column(
        children: <Widget>[
          detail(midHeight),
          Expanded(
            child: StreamBuilder<List<League>>(
              stream: bloc.stream,
              builder: (ctx, snap) {
                if (snap == null) {
                  return NoData("Aucune données");
                } else if (!snap.hasData) {
                  return NoData("N'a pas de données");
                } else {
                  return NoData(snap.data.length.toString());
                }
              },
            ),
          )
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
                imageUrl: sport.thumb,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(sport.desc),
              ),
            ],
          ),
        ),
      ),
    );
  }
}