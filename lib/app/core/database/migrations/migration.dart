import 'package:sqflite/sqlite_api.dart';

abstract class Migration {
  create(Batch batch);
  update(Batch batch);
}
