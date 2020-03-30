import 'package:flutter/material.dart';
import 'package:sportsapp/models/sport.dart';
import 'package:sportsapp/ui/widgets/my_app_bar.dart';
import 'package:sportsapp/ui/widgets/no_data.dart';

class SportScreen extends StatelessWidget {
  final Sport sport;
  SportScreen(this.sport);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(titleString: sport.name),
      body: NoData(sport.name),
    );

  }
}