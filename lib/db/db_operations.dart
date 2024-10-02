import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../utils/model_notes.dart';

class DatabaseHelper {
  static final _databaseName = "myNote.db";
  static final _databaseVersion = 1;

  static final table = 'notes_table';

  static final columnId = 'id';
  static final columnTitle = 'title';
  static final columnBody = 'body';
  static final columnDate = 'date';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    //return _database;
    // lazily instantiate the db the first time it is accessed
     _database = await initDatabase();
     return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitle TEXT NOT NULL,
            $columnBody TEXT NOT NULL,
            $columnDate TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Note note) async {
    Database db = await instance.database;
    if (note.title.trim().isEmpty) note.title = 'Untitled Note';
    return await db.insert(
        table, {'title': note.title, 'body': note.body, 'date': note.date});
  }

  // Queries rows based on the argument received
  Future<List<Map<String, dynamic>>> queryRows(id) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnId LIKE '%$id%'");
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Note note) async {
    Database db = await instance.database;
    int id = note.toMap()['id'];
    return await db
        .update(table, note.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Note>> getNotesFromDB() async {
    final db = await database;
    List<Note> notesList = [];
    List<Map> maps = await db.query(table);
    if (maps.length > 0) {
      maps.forEach((map) {
        notesList.add(Note.fromMap(map as Map<String, dynamic>));
      });
    }
    return notesList;
  }

  // Fetching Notes from ID
  Future<List<Note>> fetchNotesFromID(id) async {
    final db = await database;
    List<Note> notesList = [];
    List<Map> maps = await db.query(table, where: "$columnId LIKE '%$id%'");
    if (maps.length > 0) {
      maps.forEach((map) {
        notesList.add(Note.fromMap(map as Map<String, dynamic>));
      });
    }
    return notesList;
  }
}
