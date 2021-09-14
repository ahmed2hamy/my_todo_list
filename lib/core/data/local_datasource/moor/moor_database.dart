import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:my_todo_list/core/data/local_datasource/moor/moor_helper.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as paths;

Database constructDb({bool logStatements = false}) {
  if (Platform.isAndroid || Platform.isIOS) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'todomoor.sqlite'));
      return VmDatabase(dbFile, logStatements: logStatements);
    });
    return Database(executor);
  }
  // else if (kIsWeb) {
  //   return Database(WebDatabase('db', logStatements: logStatements));
  // }
  else {
    throw 'Platform not supported';
  }
}
