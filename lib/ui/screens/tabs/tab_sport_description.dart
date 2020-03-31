import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/models/sport.dart';

class TabSportDescription extends StatelessWidget {
  final Sport sport;
  TabSportDescription(this.sport);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Card(
        elevation: 7.5,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: sport.thumb,
                errorWidget: (context, url, error) => const Icon(Icons.error),
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