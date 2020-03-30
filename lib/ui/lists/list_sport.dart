import 'package:flutter/material.dart';
import 'package:sportsapp/models/sport.dart';
import 'package:sportsapp/ui/tile/tile_sport.dart';

class ListSport extends StatelessWidget {
  final List<Sport> sports;

  ListSport(this.sports);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: sports.length,
        itemBuilder: (context, index) => TileSport(sports[index])
    );
  }
}