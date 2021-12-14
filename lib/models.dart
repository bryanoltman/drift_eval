import 'package:drift/drift.dart';

part 'models.g.dart';

class Employees extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 100)();
  IntColumn get jobId => integer()();
  IntColumn get managerId => integer().nullable()();
}

class Jobs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 100)();
}

@DriftDatabase(tables: [Employees, Jobs])
class MyDatabase {}
