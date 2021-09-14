import 'package:moor/moor.dart';

import '../db_helper.dart';
import 'moor_database.dart';

part 'moor_helper.g.dart';

class MoorHelper extends DbHelper<Database> {
  Database? _database;

  @override
  Future<Database> get database async {
    return _database ?? await constructDb(logStatements: false);
  }
}

class TodoTable extends Table {
  DateTimeColumn get dateCreated => dateTime()();

  TextColumn get title => text()();

  BoolColumn get isChecked => boolean()();

  @override
  Set<Column>? get primaryKey => {title, isChecked};
}

@UseMoor(
  tables: [
    TodoTable,
  ],
)
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {},
    );
  }
}
