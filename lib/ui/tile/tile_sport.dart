import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/blocs/bloc_router.dart';
import 'package:sportsapp/models/sport.dart';

class TileSport extends StatelessWidget {
  final Sport sport;
  TileSport(this.sport);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Card(
        elevation: 7.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              sport.name,
              style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic),),
            CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl: sport.thumb,
              width: MediaQuery.of(context).size.width / 2,
            ),
          ],
        ),
      ),
      onTap: () => Navigator.of(context).push(BlocRouter().sportDetail(sport)),
    );
  }

}