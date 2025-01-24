import 'dart:io';
import 'package:data_collect/form_data.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'etresor_db.sqlite'));
      return NativeDatabase(file);
    },
  );
}

@DriftDatabase(tables: [Form])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 2;

Future<List<FormData>> getForms()async{
 return await select(form).get();
}
}