import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/blocs/bloc_provider.dart';
import 'package:sportsapp/blocs/bloc_sport.dart';
import 'package:sportsapp/models/sport.dart';
import 'package:sportsapp/ui/lists/list_sport.dart';
import 'package:sportsapp/ui/widgets/my_app_bar.dart';
import 'package:sportsapp/ui/widgets/no_data.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 5;
    final bloc = BlocProvider.of<BlocSport>(context);
    return Scaffold(
      appBar: MyAppBar(titleString: "I ♥️ sports"),
      body: Column(
        children: <Widget>[
          Image.asset("images/divers-sports.png", height: height,),
          Expanded(child: Container(child: Text("A faire plus tard"))),
          Container(
            height: height,
            child: StreamBuilder<List<Sport>>(
              stream: bloc.stream,
              builder: (context, snap) {
                if (snap == null) {
                  return NoData("Pas de données");
                } else if (!snap.hasData) {
                  return NoData("Données vides");
                } else {
                  return ListSport(snap.data);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}