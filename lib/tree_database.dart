import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class TreeDatabase {
  final Future<Database> database;

  TreeDatabase({path:String}) : database = openDatabase(path);

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
