import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/services/sportsDB_api.dart';
import 'package:sportsapp/ui/widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SportsDBApi().fetchSports();
    return Scaffold(
      appBar: MyAppBar(titleString: "I ♥️ sports"),
      body: Center(child: Text("Salut les codeurs")),
    );
  }
}