import 'package:flutter/foundation.dart';
import 'package:loan_app/hisaab_entry.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DBHelper {
  late Database database;

  Future<DBHelper> openDB() async {
    if (kIsWeb) databaseFactory = databaseFactoryFfiWeb;
    database = await openDatabase(
      'hisaab_tracker.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE hisaab_entry(id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(20), subtitle VARCHAR(38), number VARCHAR(38))',
        );
      },
    );
    return this;
  }


  Future<void> insert(HisaabEntry data) async {
    await database.insert('hisaab_entry', data.toMap());
  }


  Future<List<HisaabEntry>> readAllEntries() async {
    // There can be error here
    var data = await database.query('hisaab_entry');
    List<HisaabEntry> list = [];
    for (var item in data) {
      list.add(HisaabEntry.fromMap(item));
    }
    return list;
  }


  Future<void> delete(HisaabEntry item) async {
    await database.delete('hisaab_entry', where: 'id=?', whereArgs: [item.id]);
  }


}


