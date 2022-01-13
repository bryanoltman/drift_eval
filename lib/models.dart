import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
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

class Animals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 100)();
}

class Cats extends Animals {
  IntColumn get numLives => integer()();
}

class Dogs extends Animals {
  BoolColumn get goesToHeaven => boolean()();
}

Future<DriftIsolate> _createDriftIsolate() async {
  // this method is called from the main isolate. Since we can't use
  // getApplicationDocumentsDirectory on a background isolate, we calculate
  // the database path in the foreground isolate and then inform the
  // background isolate about the path.
  final dir = await getApplicationDocumentsDirectory();
  final path = p.join(dir.path, 'db.sqlite');
  final receivePort = ReceivePort();

  await Isolate.spawn(
    _startBackground,
    _IsolateStartRequest(receivePort.sendPort, path),
  );

  // _startBackground will send the DriftIsolate to this ReceivePort
  return await receivePort.first as DriftIsolate;
}

void _startBackground(_IsolateStartRequest request) {
  // this is the entry point from the background isolate! Let's create
  // the database from the path we received
  final executor = NativeDatabase(File(request.targetPath));
  // we're using DriftIsolate.inCurrent here as this method already runs on a
  // background isolate. If we used DriftIsolate.spawn, a third isolate would be
  // started which is not what we want!
  final driftIsolate = DriftIsolate.inCurrent(
    () => DatabaseConnection.fromExecutor(executor),
  );
  // inform the starting isolate about this, so that it can call .connect()
  request.sendDriftIsolate.send(driftIsolate);
}

// used to bundle the SendPort and the target path, since isolate entry point
// functions can only take one parameter.
class _IsolateStartRequest {
  final SendPort sendDriftIsolate;
  final String targetPath;

  _IsolateStartRequest(this.sendDriftIsolate, this.targetPath);
}

DatabaseConnection getConnection() {
  return DatabaseConnection.delayed(() async {
    final isolate = await _createDriftIsolate();
    return await isolate.connect();
  }());
}

@DriftDatabase(tables: [
  Employees,
  Jobs,
  Cats,
  Dogs,
])
class MyDatabase extends _$MyDatabase {
  factory MyDatabase.create() {
    DatabaseConnection connection = getConnection();
    return MyDatabase.connect(connection);
  }

  MyDatabase.connect(DatabaseConnection connection) : super.connect(connection);

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Stream<List<Job>> get allJobs => select(jobs).watch();

  Stream<List<Employee>> get allEmployees => select(employees).watch();

  Stream<List<Employee>> employeesWithJobId(int jobId) =>
      (select(employees)..where((tbl) => tbl.jobId.equals(jobId))).watch();

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

  Stream<List<Cat>> get allCats => select(cats).watch();

  Stream<List<Dog>> get allDogs => select(dogs).watch();

  Future<int> addCat({required String name, required int numLives}) {
    final companion = CatsCompanion.insert(
      name: name,
      numLives: numLives,
    );
    return into(cats).insert(companion);
  }

  Future<int> addDog({required String name, required bool goesToHeaven}) {
    final companion = DogsCompanion.insert(
      name: name,
      goesToHeaven: goesToHeaven,
    );
    return into(dogs).insert(companion);
  }
}
