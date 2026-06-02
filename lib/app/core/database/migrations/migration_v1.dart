import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo_list_app/app/core/database/migrations/migration.dart';

class MigrationV1 implements Migration {
  @override
  create(Batch batch) {
    batch.execute('''
      CREATE TABLE todo (
        id Integer primary key autoincrement,
        descricao varchar(500) not null,
        data_hora datetime,
        finalizado Integer
      )
    ''');
  }

  @override
  update(Batch batch) {}
}
