import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:street_trees/tree_database.dart';
import 'package:street_trees/tree_display.dart';

class RouteSplash extends StatefulWidget {
  @override
  _RouteSplashState createState() => _RouteSplashState();
}

class _RouteSplashState extends State<RouteSplash> {
  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  void initializeDatabase() async {
    final path = await TreeDatabase.extractDatabase();
    GetIt.I.registerSingleton<TreeDatabase>(TreeDatabase(path: path));
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => TreeDisplay()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
