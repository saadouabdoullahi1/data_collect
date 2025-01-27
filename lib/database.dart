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
      final file = File(p.join(dbFolder.path, 'database.sqlite'));
      return NativeDatabase(file);
    },
  );
}

@DriftDatabase(tables: [Form])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  Future<Stream<List<FormData>>> getForms() async {
    return select(form).watch();
  }

  Future<int> insertForm(FormCompanion entity) async {
    return await into(form).insert(entity);
  }
}
