import 'package:flutter/material.dart';
import '../models/note.dart';
import '../database/db_helper.dart';

class NoteProvider extends ChangeNotifier {
  final DbHelper _dbHelper = DbHelper();
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> loadNotes() async {
    _notes = await _dbHelper.getAll();
    notifyListeners();
  }

  Future<void> addNote(String title, String content) async {
    final note = Note(
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    await _dbHelper.insert(note);
    await loadNotes();
  }

  Future<void> updateNote(Note note) async {
    await _dbHelper.update(note);
    await loadNotes();
  }

  Future<void> deleteNote(int id) async {
    await _dbHelper.delete(id);
    await loadNotes();
  }
}