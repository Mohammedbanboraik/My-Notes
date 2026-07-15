// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'moh.db');
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 7,
      onUpgrade: _onUpgrade,
    );
    return mydb;
  }

  Future<void> _onUpgrade(Database db, int oldversion, newversion) async {
    print("OnUpgrade=================================");
    // await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
  }

  Future<void> _onCreate(Database db, int version) async {
    Batch batch = db.batch();

    batch.execute('''
         CREATE TABLE "notes"(
              "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
              "title" TEXT NOT NULL,
              "note" TEXT NOT NULL
         )
''');

    await batch.commit();
    print("OnCreated =======================");
  }

  Future readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  Future insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  Future updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  Future deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  Future mydeletedatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'moh.db');
    await deleteDatabase(path);
  }

  Future read(String table) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table);
    return response;
  }

  Future insert(String table, Map<String, Object?> values) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table, values);
    return response;
  }

  Future update(
    String table,
    Map<String, Object?> values,
    String? mywhere,
  ) async {
    Database? mydb = await db;
    int response = await mydb!.update(table, values, where: mywhere);
    return response;
  }

  Future delete(String table, String? mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table, where: mywhere);
    return response;
  }
}
