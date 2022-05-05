import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/core/constant/local_db_constant.dart';
import 'package:getx_boilerplate/core/utils/print_utils.dart';
import 'package:path/path.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class LocalDatabase extends GetxService {
  late Database? db;

  Future<Database> get database async {
    if (db != null) {
      return db!;
    }
    return initializeDb(LocalDBConstant.dbPassword);
  }

  @override
  void onInit() {
    initializeDb(LocalDBConstant.dbPassword);
    super.onInit();
  }

  Future<Database> initializeDb(String dbPass) async {
    final _db = await openDatabase(
      join(await getDatabasesPath(), "database.db"),
      onOpen: (db) {
        PrintUtils.print("OPEN LOCAL DB");
      },
      password: dbPass,
      version: LocalDBConstant.dbVersion,
      // if the database does not exist, onCreate executes all the sql
      onCreate: _onCreateDb,

      /// if the database exists but the version of the database is different
      /// from the version defined in parameter, onUpgrade will execute all sql requests greater than the old version
      onUpgrade: _onUpgradeDb,
    );
    db = _db;
    return _db;
  }

  Future<List<String>> _readSqlScript(
      {int version = 0, bool isInitial = false}) async {
    final rawResult = await rootBundle.loadString(isInitial
        ? LocalDBConstant.initialScript
        : LocalDBConstant.migrationForVersion(version));
    final result = const LineSplitter().convert(rawResult);
    return result;
  }

  Future<void> _onCreateDb(Database db, int version) async {
    PrintUtils.print('creating db');
    await _executeSqlScript(db, 1, version, isInitial: true);
  }

  Future<void> _onUpgradeDb(Database db, int oldVersion, int newVersion) async {
    PrintUtils.print('upgrading db');
    await _executeSqlScript(db, oldVersion, newVersion);
  }

  Future<void> _executeSqlScript(Database db, int oldVersion, int newVersion,
      {bool isInitial = false}) async {
    Future<void> executeBatch(Future<List<String>> listFunction) async {
      final batch = db.batch();
      final result = await listFunction;
      result.forEach(batch.execute);
      await batch.commit();
    }

    if (isInitial) {
      try {
        await executeBatch(
          _readSqlScript(isInitial: true),
        );
      } catch (e) {
        rethrow;
      }
    }

    for (var i = oldVersion; i < newVersion; i++) {
      final nextDatabaseVersion = i + 1;
      try {
        await executeBatch(
          _readSqlScript(version: nextDatabaseVersion),
        );
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> dropAllTable() async {
    try {
      for (final tableName in LocalDBConstant.dbTableList) {
        await db?.delete(tableName);
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  Future close() async => db?.close();

  @override
  void onClose() {
    close();
    super.onClose();
  }
}
