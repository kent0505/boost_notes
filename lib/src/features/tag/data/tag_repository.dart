import 'package:sqflite/sqflite.dart';

import '../models/tag.dart';

abstract interface class TagRepository {
  const TagRepository();

  Future<List<Tag>> loadTags();
  Future<void> addTag(Tag model);
  Future<void> editTag(Tag model);
  Future<void> deleteTag(Tag model);
}

final class TagRepositoryImpl implements TagRepository {
  TagRepositoryImpl({required Database db}) : _db = db;

  final Database _db;

  @override
  Future<List<Tag>> loadTags() async {
    final maps = await _db.query(Tag.table);
    return maps.map((map) {
      return Tag.fromMap(map);
    }).toList();
  }

  @override
  Future<void> addTag(Tag model) async {
    await _db.insert(
      Tag.table,
      model.toMap(),
    );
  }

  @override
  Future<void> editTag(Tag model) async {
    await _db.update(
      Tag.table,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  @override
  Future<void> deleteTag(Tag model) async {
    await _db.delete(
      Tag.table,
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }
}
