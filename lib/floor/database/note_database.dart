


import 'package:floor/floor.dart';
import 'package:sqlite_app/floor/database/note_dao.dart';
import 'package:sqlite_app/floor/database/note_table.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'note_database.g.dart';

// flutter pub run build_runner watch

@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase{

  NoteDao get noteDao;

}