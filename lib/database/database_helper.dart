import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  late Database _database;
  static const String tableName = 'students';

  DatabaseHelper(){
    _createDatabase();
  }


  Future<Database> _createDatabase() async{

    var datePath = await getDatabasesPath(); //folder 

    String path = join(datePath, 'database.db');

    _database = await openDatabase(path);

    await _database.execute('CREATE TABLE IF NOT EXISTS $tableName (id INTEGER PRIMARY KEY, name TEXT, address TEXT, phone TEXT)');

    return _database;
  }


  Future<int> insertStudent(Map<String,dynamic> student) async{
      _database = await _createDatabase();
    return await _database.insert(tableName, student);
  }

 Future<List<Map<String,dynamic>>> getAllStudents() async{
    _database = await _createDatabase();
    // _database.rawQuery('SELECT * FROM $tableName');
    return await _database.query(tableName,columns: ['id','name','address','phone']);
  }


  Future<int> updateStudent(Map<String,dynamic> student, int id) async{
    _database = await _createDatabase();
    return await _database.update(tableName, student, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteStudent(int id) async{
    _database = await _createDatabase();
    return await _database.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllStudents() async{
    _database = await _createDatabase();

    return await _database.rawDelete('DELETE FROM $tableName');
    
    // return await _database.delete(tableName);
  }


}