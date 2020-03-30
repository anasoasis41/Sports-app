import 'package:flutter/material.dart';
import 'package:sportsapp/blocs/bloc_provider.dart';
import 'package:sportsapp/blocs/bloc_sport.dart';
import 'package:sportsapp/ui/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocProvider<BlocSport>(
        bloc: BlocSport(),
        child: HomeScreen(),
      ),
    );
  }
}