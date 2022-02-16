import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _db;
  DBHelper._init();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }

    return _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cakebakery.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    //Xóa Sqflite trường hợp debug
    //await deleteDatabase(path);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE user (id INTEGER PRIMARY KEY, username VARCHAR NOT NULL, password VARCHAR, email TEXT , fullname NVARCHAR , address1 TEXT , address2 TEXT, phone VARCHAR , avatar VARCHAR ,otp VARCHAR, userToken VARCHAR, status INTEGER)');
  }

  Future<UserDB> insertUser(UserDB user) async {
    var dbClient = await db;
    await dbClient.insert('user', user.toJson());

    return user;
  }

  Future<UserDB> getUser() async {
    var dbClient = await db;
    final queryResult = await dbClient.query('user');
    return UserDB.fromJson(queryResult.first);
  }

  Future<int> delete(id, String table) async {
    var dbClient = await db;
    print('xoa thanh cong');
    return await dbClient.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
