import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'models.g.dart';

class Employees extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 100)();
  IntColumn get jobId => integer()();
  IntColumn get managerId => integer().nullable()();
}

class Jobs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(max: 100)();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Employees, Jobs])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Stream<List<Job>> get allJobs => select(jobs).watch();

  Future<List<Employee>> get allEmployees => select(employees).get();

  Stream<List<Employee>> employeesWithJobId(int jobId) =>
      (select(employees)..where((tbl) => tbl.id.equals(jobId))).watch();

  Future<int> addJob(String title) async {
    final companion = JobsCompanion(title: Value(title));
    return into(jobs).insert(companion);
  }

  Future<int> addEmployee({required String name, required int jobId}) async {
    final companion = EmployeesCompanion(
      name: Value(name),
      jobId: Value(jobId),
    );
    return into(employees).insert(companion);
  }
}
