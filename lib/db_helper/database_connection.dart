import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_crud2');
    var database = await openDatabase(
      path,
      version: 2, // Increment the version after modifying the schema
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase, // Add an onUpgrade callback if needed
    );
    return database;
  }

Future<void> _createDatabase(Database database, int version) async {
  print('Database version: $version');
  String sql = "CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, contact TEXT, address TEXT, description TEXT);";
  await database.execute(sql);
}

  Future<void> _upgradeDatabase(Database database, int oldVersion, int newVersion) async {
  }
}