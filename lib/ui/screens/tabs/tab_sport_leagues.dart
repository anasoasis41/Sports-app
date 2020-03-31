import 'package:flutter/material.dart';
import 'package:sportsapp/blocs/bloc_league.dart';
import 'package:sportsapp/blocs/bloc_provider.dart';
import 'package:sportsapp/models/league.dart';
import 'package:sportsapp/ui/lists/list_league.dart';
import 'package:sportsapp/ui/widgets/no_data.dart';

class TabSportLeagues extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocLeague>(context);

    return Container(
          child: StreamBuilder<List<League>>(
            stream: bloc.stream,
            builder: (ctx, snap) {
              if (snap == null) {
                return NoData("Aucune données");
              } else if (!snap.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListLeague(snap.data);
              }
            },
          ),
    );

  }
}