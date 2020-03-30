import 'package:flutter/material.dart';
import 'package:sportsapp/models/sport.dart';

class TileSport extends StatelessWidget {
  final Sport sport;
  TileSport(this.sport);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 7.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            sport.name,
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic),),
          Image.network(
          sport.thumb,
          width: MediaQuery.of(context).size.width / 2,
          ),
        ],
      ),
    );
  }

}