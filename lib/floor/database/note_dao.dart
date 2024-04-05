
import 'package:floor/floor.dart';
import 'package:sqlite_app/floor/database/note_table.dart';

@dao
abstract class NoteDao{
  
  @Query('select * from note')
  Stream<List<Note>> getAllNote();

  @insert
  Future<void> addNote(Note note);

  @Query('DELETE FROM note WHERE id = :id')
  Future<void> delete(int id);

  @update
  Future<void> updateNote(Note note);

  @Query('DELETE FROM note')
  Future<void> deleteAllNote();


}