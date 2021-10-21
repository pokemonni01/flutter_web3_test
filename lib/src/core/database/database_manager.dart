import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_sql_command.dart';

const String _databaseFileName = "crypto_currency.db";

abstract class DatabaseManager {

  void initialDatabase();

  Future<void> insert(String table, Map<String, Object?> values);

  Future<List<Map<String, dynamic>>?> query(String table);
}

class DatabaseManagerImpl extends DatabaseManager {

  Future<Database>? _database;

  @override
  void initialDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    getDatabase
    _database = openDatabase(
      _databaseFileName,
      onCreate: (db, version) {
        return db.execute(
          DatabaseSql.createNetworkTable +
          DatabaseSql.insertEthMainNetToNetworkTable,
        );
      },
      version: 1,
    );
  }

  @override
  Future<void> insert(String table, Map<String, Object?> values) async {
    final db = await _database;
    await db?.insert(
      table,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Map<String, dynamic>>?> query(String table) async {
    final db = await _database;
    return await db?.query(table);
  }
}
