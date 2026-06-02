import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:synchronized/synchronized.dart';

class SqliteConnectionFactory {
  static const String DATABASE_NAME = 'app_database';
  static const int DATABASE_VERSION = 1;

  static SqliteConnectionFactory? _instance;

  Database? _database;

  final _lock = Lock();

  SqliteConnectionFactory._();

  factory SqliteConnectionFactory() {
    //   if (_instance == null){
    //     _instance = SqliteConnectionFactory._();
    //   }
    //   return _instance!;

    // }
    _instance ??= SqliteConnectionFactory._();
    return _instance!;
  }

  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databaseFinalPath = join(databasePath, DATABASE_NAME);

    if (_database == null) {
      await _lock.synchronized(() async {
        _database ??= await openDatabase(
          databaseFinalPath,
          version: DATABASE_VERSION,
          onConfigure: _onConfigure,
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
          onDowngrade: _onDowngrade,
        );
      });
    }
    return _database!;
  }

  void closeConnection() {
    _database?.close();
    _database = null;
  }

  Future<void> _onConfigure(Database database) async {
    await database.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database database, int version) async {}
  Future<void> _onUpgrade(
    Database database,
    int oldVersion,
    int newVersion,
  ) async {}
  Future<void> _onDowngrade(
    Database database,
    int oldVersion,
    int newVersion,
  ) async {}
}
