import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:street_trees/tree_database.dart';
import 'package:street_trees/tree.dart';

class TreeDisplay extends StatefulWidget {
  @override
  _TreeDisplayState createState() => _TreeDisplayState();
}

class _TreeDisplayState extends State<TreeDisplay> {
  List<Tree> trees;
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    loadTrees();
  }

  void loadTrees() async {
    TreeDatabase database = GetIt.I<TreeDatabase>();
    List<Tree> theTrees = await database.trees();
    setState(() {
      trees = theTrees;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: isLoaded
                ? ListView.builder(
                    itemCount: trees.length,
                    itemBuilder: (context, i) {
                      return ListTile(title: Text('${trees[i].commonName}'));
                    })
                : CircularProgressIndicator()));
  }
}
