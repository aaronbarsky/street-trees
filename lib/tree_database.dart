import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:street_trees/tree.dart';

class TreeDatabase {
  final Future<Database> database;

  TreeDatabase({path:String}) : database = openDatabase(path);

  Future<List<Tree>> trees() async {
    final Database db = await database;
    final List<Map<String, dynamic>> allTrees = await db.query('ZTREE');
    return List.generate (allTrees.length, (i) {
      DateTime datePlanted = DateTime.fromMicrosecondsSinceEpoch(allTrees[i]['ZDATEPLANTED']);
      return Tree (
        treeId: allTrees[i]['ZTREEID'],
        commonName: allTrees[i]['ZCOMMONNAME'],
        cultivarName: allTrees[i]['ZCULTIVARNAME'],
        datePlanted: datePlanted,
        diameter: allTrees[i]['ZDIAMETER'],
        genusName: allTrees[i]['ZGENUSNAME'],
        latitude: allTrees[i]['ZLATITUDE'],
        longitude: allTrees[i]['ZLONGITUDE'],
        speciesName: allTrees[i]['ZSPECIESNAME']
      );
    });
  }

  static Future<String> extractDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "trees.sqlite");

    ByteData data = await rootBundle.load(join("assets", "trees.sqlite"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);
    return path;
  }
}
