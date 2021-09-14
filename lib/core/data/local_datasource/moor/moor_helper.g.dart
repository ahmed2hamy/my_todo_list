// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_helper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TodoTableData extends DataClass implements Insertable<TodoTableData> {
  final DateTime dateCreated;
  final String title;
  final bool isChecked;
  TodoTableData(
      {required this.dateCreated,
      required this.title,
      required this.isChecked});
  factory TodoTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TodoTableData(
      dateCreated: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_created'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      isChecked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_checked'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['title'] = Variable<String>(title);
    map['is_checked'] = Variable<bool>(isChecked);
    return map;
  }

  TodoTableCompanion toCompanion(bool nullToAbsent) {
    return TodoTableCompanion(
      dateCreated: Value(dateCreated),
      title: Value(title),
      isChecked: Value(isChecked),
    );
  }

  factory TodoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TodoTableData(
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      title: serializer.fromJson<String>(json['title']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'title': serializer.toJson<String>(title),
      'isChecked': serializer.toJson<bool>(isChecked),
    };
  }

  TodoTableData copyWith(
          {DateTime? dateCreated, String? title, bool? isChecked}) =>
      TodoTableData(
        dateCreated: dateCreated ?? this.dateCreated,
        title: title ?? this.title,
        isChecked: isChecked ?? this.isChecked,
      );
  @override
  String toString() {
    return (StringBuffer('TodoTableData(')
          ..write('dateCreated: $dateCreated, ')
          ..write('title: $title, ')
          ..write('isChecked: $isChecked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(dateCreated.hashCode, $mrjc(title.hashCode, isChecked.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoTableData &&
          other.dateCreated == this.dateCreated &&
          other.title == this.title &&
          other.isChecked == this.isChecked);
}

class TodoTableCompanion extends UpdateCompanion<TodoTableData> {
  final Value<DateTime> dateCreated;
  final Value<String> title;
  final Value<bool> isChecked;
  const TodoTableCompanion({
    this.dateCreated = const Value.absent(),
    this.title = const Value.absent(),
    this.isChecked = const Value.absent(),
  });
  TodoTableCompanion.insert({
    required DateTime dateCreated,
    required String title,
    required bool isChecked,
  })  : dateCreated = Value(dateCreated),
        title = Value(title),
        isChecked = Value(isChecked);
  static Insertable<TodoTableData> custom({
    Expression<DateTime>? dateCreated,
    Expression<String>? title,
    Expression<bool>? isChecked,
  }) {
    return RawValuesInsertable({
      if (dateCreated != null) 'date_created': dateCreated,
      if (title != null) 'title': title,
      if (isChecked != null) 'is_checked': isChecked,
    });
  }

  TodoTableCompanion copyWith(
      {Value<DateTime>? dateCreated,
      Value<String>? title,
      Value<bool>? isChecked}) {
    return TodoTableCompanion(
      dateCreated: dateCreated ?? this.dateCreated,
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoTableCompanion(')
          ..write('dateCreated: $dateCreated, ')
          ..write('title: $title, ')
          ..write('isChecked: $isChecked')
          ..write(')'))
        .toString();
  }
}

class $TodoTableTable extends TodoTable
    with TableInfo<$TodoTableTable, TodoTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TodoTableTable(this._db, [this._alias]);
  final VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  late final GeneratedColumn<DateTime?> dateCreated =
      GeneratedColumn<DateTime?>('date_created', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _isCheckedMeta = const VerificationMeta('isChecked');
  late final GeneratedColumn<bool?> isChecked = GeneratedColumn<bool?>(
      'is_checked', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_checked IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [dateCreated, title, isChecked];
  @override
  String get aliasedName => _alias ?? 'todo_table';
  @override
  String get actualTableName => 'todo_table';
  @override
  VerificationContext validateIntegrity(Insertable<TodoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    } else if (isInserting) {
      context.missing(_dateCreatedMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    } else if (isInserting) {
      context.missing(_isCheckedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {title, isChecked};
  @override
  TodoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TodoTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TodoTableTable createAlias(String alias) {
    return $TodoTableTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TodoTableTable todoTable = $TodoTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoTable];
}
