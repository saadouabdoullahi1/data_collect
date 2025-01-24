import 'package:drift/drift.dart';

class Form extends Table {
  IntColumn get id => integer().withDefault(Constant(0))();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get contact => text().nullable()();
  IntColumn get sexe => integer().nullable()();
  IntColumn get age => integer().nullable()();
  TextColumn get birthdate => text().nullable()();
  IntColumn get numberOfDependents => integer().nullable()();
  TextColumn get urlImage => text().nullable()();
}
