import 'package:sqflite/sqflite.dart';

import '../models/note.dart';

abstract interface class NoteRepository {
  const NoteRepository();

  Future<List<Note>> loadNotes();
  Future<void> addNote(Note model);
  Future<void> editNote(Note model);
  Future<void> deleteNote(Note model);
}

final class NoteRepositoryImpl implements NoteRepository {
  NoteRepositoryImpl({required Database db}) : _db = db;

  final Database _db;

  @override
  Future<List<Note>> loadNotes() async {
    final maps = await _db.query(Note.table);
    return maps.map((map) {
      return Note.fromMap(map);
    }).toList();
  }

  @override
  Future<void> addNote(Note model) async {
    await _db.insert(
      Note.table,
      model.toMap(),
    );
  }

  @override
  Future<void> editNote(Note model) async {
    await _db.update(
      Note.table,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  @override
  Future<void> deleteNote(Note model) async {
    await _db.delete(
      Note.table,
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }
}
