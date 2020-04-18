import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:street_trees/tree_database.dart';

class RouteSplash extends StatefulWidget {
  @override
  _RouteSplashState createState() => _RouteSplashState();
}

class _RouteSplashState extends State<RouteSplash> {
  bool shouldProceed = false;

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  void initializeDatabase() async {
    final path = await TreeDatabase.extractDatabase();
    GetIt.I.registerSingleton<TreeDatabase>(TreeDatabase(path: path));
    setState(() {
      shouldProceed = true; //got the prefs; set to some value if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: shouldProceed
            ? RaisedButton(
                onPressed: () {
                  //move to next screen and pass the prefs if you want
                },
                child: Text("Continue"),
              )
            : CircularProgressIndicator(), //show splash screen here instead of progress indicator
      ),
    );
  }
}
