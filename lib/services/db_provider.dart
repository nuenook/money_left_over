import 'dart:io';

import 'package:money_left_over/models/expenditure.dart';
import 'package:path_provider/path_provider.dart';
import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

class DBProvider {
  static Database _database;
  DBProvider._();
  static final DBProvider db = DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Expenditure ("
          "id INTEGER PRIMARY KEY,"
          "note TEXT,"
          "amount REAL,"
          "onDate TEXT"
          ")");
    });
  }

  newClient(Expenditure newExpenditure) async {
    final db = await database;
    var res = await db.insert("Expenditure", newExpenditure.toMap());
    return res;
  }

  getAllExpenditure() async {
    final db = await database;
    var res = await db.query("Expenditure");
    List<Expenditure> list =
        res.isNotEmpty ? res.map((c) => Expenditure.fromMap(c)).toList() : [];
    return list;
  }

  deleteClient(int id) async {
    final db = await database;
    db.delete("Expenditure", where: "id = ?", whereArgs: [id]);
  }
}
