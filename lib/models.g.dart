// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Employee extends DataClass implements Insertable<Employee> {
  final int id;
  final String name;
  final int jobId;
  final int? managerId;
  Employee(
      {required this.id,
      required this.name,
      required this.jobId,
      this.managerId});
  factory Employee.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Employee(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      jobId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}job_id'])!,
      managerId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}manager_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['job_id'] = Variable<int>(jobId);
    if (!nullToAbsent || managerId != null) {
      map['manager_id'] = Variable<int?>(managerId);
    }
    return map;
  }

  EmployeesCompanion toCompanion(bool nullToAbsent) {
    return EmployeesCompanion(
      id: Value(id),
      name: Value(name),
      jobId: Value(jobId),
      managerId: managerId == null && nullToAbsent
          ? const Value.absent()
          : Value(managerId),
    );
  }

  factory Employee.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Employee(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      jobId: serializer.fromJson<int>(json['jobId']),
      managerId: serializer.fromJson<int?>(json['managerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'jobId': serializer.toJson<int>(jobId),
      'managerId': serializer.toJson<int?>(managerId),
    };
  }

  Employee copyWith({int? id, String? name, int? jobId, int? managerId}) =>
      Employee(
        id: id ?? this.id,
        name: name ?? this.name,
        jobId: jobId ?? this.jobId,
        managerId: managerId ?? this.managerId,
      );
  @override
  String toString() {
    return (StringBuffer('Employee(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('jobId: $jobId, ')
          ..write('managerId: $managerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, jobId, managerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Employee &&
          other.id == this.id &&
          other.name == this.name &&
          other.jobId == this.jobId &&
          other.managerId == this.managerId);
}

class EmployeesCompanion extends UpdateCompanion<Employee> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> jobId;
  final Value<int?> managerId;
  const EmployeesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.jobId = const Value.absent(),
    this.managerId = const Value.absent(),
  });
  EmployeesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int jobId,
    this.managerId = const Value.absent(),
  })  : name = Value(name),
        jobId = Value(jobId);
  static Insertable<Employee> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? jobId,
    Expression<int?>? managerId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (jobId != null) 'job_id': jobId,
      if (managerId != null) 'manager_id': managerId,
    });
  }

  EmployeesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? jobId,
      Value<int?>? managerId}) {
    return EmployeesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      jobId: jobId ?? this.jobId,
      managerId: managerId ?? this.managerId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (jobId.present) {
      map['job_id'] = Variable<int>(jobId.value);
    }
    if (managerId.present) {
      map['manager_id'] = Variable<int?>(managerId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('jobId: $jobId, ')
          ..write('managerId: $managerId')
          ..write(')'))
        .toString();
  }
}

class $EmployeesTable extends Employees
    with TableInfo<$EmployeesTable, Employee> {
  final GeneratedDatabase _db;
  final String? _alias;
  $EmployeesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<int?> jobId = GeneratedColumn<int?>(
      'job_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _managerIdMeta = const VerificationMeta('managerId');
  @override
  late final GeneratedColumn<int?> managerId = GeneratedColumn<int?>(
      'manager_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, jobId, managerId];
  @override
  String get aliasedName => _alias ?? 'employees';
  @override
  String get actualTableName => 'employees';
  @override
  VerificationContext validateIntegrity(Insertable<Employee> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('job_id')) {
      context.handle(
          _jobIdMeta, jobId.isAcceptableOrUnknown(data['job_id']!, _jobIdMeta));
    } else if (isInserting) {
      context.missing(_jobIdMeta);
    }
    if (data.containsKey('manager_id')) {
      context.handle(_managerIdMeta,
          managerId.isAcceptableOrUnknown(data['manager_id']!, _managerIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Employee map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Employee.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EmployeesTable createAlias(String alias) {
    return $EmployeesTable(_db, alias);
  }
}

class Job extends DataClass implements Insertable<Job> {
  final int id;
  final String title;
  Job({required this.id, required this.title});
  factory Job.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Job(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  JobsCompanion toCompanion(bool nullToAbsent) {
    return JobsCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory Job.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Job(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  Job copyWith({int? id, String? title}) => Job(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('Job(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Job && other.id == this.id && other.title == this.title);
}

class JobsCompanion extends UpdateCompanion<Job> {
  final Value<int> id;
  final Value<String> title;
  const JobsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  JobsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<Job> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  JobsCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return JobsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $JobsTable extends Jobs with TableInfo<$JobsTable, Job> {
  final GeneratedDatabase _db;
  final String? _alias;
  $JobsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? 'jobs';
  @override
  String get actualTableName => 'jobs';
  @override
  VerificationContext validateIntegrity(Insertable<Job> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Job map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Job.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $JobsTable createAlias(String alias) {
    return $JobsTable(_db, alias);
  }
}

class Cat extends DataClass implements Insertable<Cat> {
  final int id;
  final String name;
  final int numLives;
  Cat({required this.id, required this.name, required this.numLives});
  factory Cat.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Cat(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      numLives: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}num_lives'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['num_lives'] = Variable<int>(numLives);
    return map;
  }

  CatsCompanion toCompanion(bool nullToAbsent) {
    return CatsCompanion(
      id: Value(id),
      name: Value(name),
      numLives: Value(numLives),
    );
  }

  factory Cat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cat(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      numLives: serializer.fromJson<int>(json['numLives']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'numLives': serializer.toJson<int>(numLives),
    };
  }

  Cat copyWith({int? id, String? name, int? numLives}) => Cat(
        id: id ?? this.id,
        name: name ?? this.name,
        numLives: numLives ?? this.numLives,
      );
  @override
  String toString() {
    return (StringBuffer('Cat(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('numLives: $numLives')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, numLives);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cat &&
          other.id == this.id &&
          other.name == this.name &&
          other.numLives == this.numLives);
}

class CatsCompanion extends UpdateCompanion<Cat> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> numLives;
  const CatsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.numLives = const Value.absent(),
  });
  CatsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int numLives,
  })  : name = Value(name),
        numLives = Value(numLives);
  static Insertable<Cat> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? numLives,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (numLives != null) 'num_lives': numLives,
    });
  }

  CatsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? numLives}) {
    return CatsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      numLives: numLives ?? this.numLives,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (numLives.present) {
      map['num_lives'] = Variable<int>(numLives.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('numLives: $numLives')
          ..write(')'))
        .toString();
  }
}

class $CatsTable extends Cats with TableInfo<$CatsTable, Cat> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CatsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _numLivesMeta = const VerificationMeta('numLives');
  @override
  late final GeneratedColumn<int?> numLives = GeneratedColumn<int?>(
      'num_lives', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, numLives];
  @override
  String get aliasedName => _alias ?? 'cats';
  @override
  String get actualTableName => 'cats';
  @override
  VerificationContext validateIntegrity(Insertable<Cat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('num_lives')) {
      context.handle(_numLivesMeta,
          numLives.isAcceptableOrUnknown(data['num_lives']!, _numLivesMeta));
    } else if (isInserting) {
      context.missing(_numLivesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cat map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Cat.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CatsTable createAlias(String alias) {
    return $CatsTable(_db, alias);
  }
}

class Dog extends DataClass implements Insertable<Dog> {
  final int id;
  final String name;
  final bool goesToHeaven;
  Dog({required this.id, required this.name, required this.goesToHeaven});
  factory Dog.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Dog(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      goesToHeaven: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}goes_to_heaven'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['goes_to_heaven'] = Variable<bool>(goesToHeaven);
    return map;
  }

  DogsCompanion toCompanion(bool nullToAbsent) {
    return DogsCompanion(
      id: Value(id),
      name: Value(name),
      goesToHeaven: Value(goesToHeaven),
    );
  }

  factory Dog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Dog(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      goesToHeaven: serializer.fromJson<bool>(json['goesToHeaven']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'goesToHeaven': serializer.toJson<bool>(goesToHeaven),
    };
  }

  Dog copyWith({int? id, String? name, bool? goesToHeaven}) => Dog(
        id: id ?? this.id,
        name: name ?? this.name,
        goesToHeaven: goesToHeaven ?? this.goesToHeaven,
      );
  @override
  String toString() {
    return (StringBuffer('Dog(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('goesToHeaven: $goesToHeaven')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, goesToHeaven);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dog &&
          other.id == this.id &&
          other.name == this.name &&
          other.goesToHeaven == this.goesToHeaven);
}

class DogsCompanion extends UpdateCompanion<Dog> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> goesToHeaven;
  const DogsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.goesToHeaven = const Value.absent(),
  });
  DogsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required bool goesToHeaven,
  })  : name = Value(name),
        goesToHeaven = Value(goesToHeaven);
  static Insertable<Dog> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? goesToHeaven,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (goesToHeaven != null) 'goes_to_heaven': goesToHeaven,
    });
  }

  DogsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<bool>? goesToHeaven}) {
    return DogsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      goesToHeaven: goesToHeaven ?? this.goesToHeaven,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (goesToHeaven.present) {
      map['goes_to_heaven'] = Variable<bool>(goesToHeaven.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DogsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('goesToHeaven: $goesToHeaven')
          ..write(')'))
        .toString();
  }
}

class $DogsTable extends Dogs with TableInfo<$DogsTable, Dog> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DogsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _goesToHeavenMeta =
      const VerificationMeta('goesToHeaven');
  @override
  late final GeneratedColumn<bool?> goesToHeaven = GeneratedColumn<bool?>(
      'goes_to_heaven', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (goes_to_heaven IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [id, name, goesToHeaven];
  @override
  String get aliasedName => _alias ?? 'dogs';
  @override
  String get actualTableName => 'dogs';
  @override
  VerificationContext validateIntegrity(Insertable<Dog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('goes_to_heaven')) {
      context.handle(
          _goesToHeavenMeta,
          goesToHeaven.isAcceptableOrUnknown(
              data['goes_to_heaven']!, _goesToHeavenMeta));
    } else if (isInserting) {
      context.missing(_goesToHeavenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dog map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Dog.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DogsTable createAlias(String alias) {
    return $DogsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $EmployeesTable employees = $EmployeesTable(this);
  late final $JobsTable jobs = $JobsTable(this);
  late final $CatsTable cats = $CatsTable(this);
  late final $DogsTable dogs = $DogsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [employees, jobs, cats, dogs];
}
