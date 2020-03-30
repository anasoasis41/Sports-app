import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/models/sport.dart';
import 'package:sportsapp/ui/widgets/my_app_bar.dart';
import 'package:sportsapp/ui/widgets/no_data.dart';

class SportScreen extends StatelessWidget {
  final Sport sport;
  SportScreen(this.sport);

  @override
  Widget build(BuildContext context) {
    final midHeight = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      appBar: MyAppBar(titleString: sport.name),
      body: Column(
        children: <Widget>[
          detail(midHeight)
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