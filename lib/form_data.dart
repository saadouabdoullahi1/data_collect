import 'package:drift/drift.dart';

class Form extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get quarter => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get sexe => text().withLength(min: 1, max: 1)();
  IntColumn get age => integer().nullable()();
  TextColumn get birthdate => text().nullable()();
  IntColumn get numberOfDependents => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  TextColumn get urlImage => text().nullable()();
  TextColumn get urlIdCard => text().nullable()();
}
