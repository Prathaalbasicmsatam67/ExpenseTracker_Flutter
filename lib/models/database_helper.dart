import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app_expensetracker/models/task_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;

  DatabaseHelper._instance();

  String task_table = "task_details";
  String col_title = "title";
  String col_id = "id";
  String col_date = "date";
  String col_priority = "priority";
  String col_status = "status";

  Future<Database> get db async {
    if (_db == null) {
      return initDb();
    }
    return _db;
  }

  Future<Database> initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'personal_tracker.db';
    final trackerDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return trackerDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $task_table($col_id INTEGER PRIMARY KEY AUTOINCREMENT, $col_title TEXT, $col_date TEXT, $col_priority TEXT, $col_status INTEGER)");
  }

  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(task_table);
    return result;
  }

  Future<List<Task>> getTaskList() async {
    final List<Map<String, dynamic>> taskMap = await getTaskMapList();
    final List<Task> taskList = [];
    taskMap.forEach((_taskMap) {
      taskList.add(Task.fromMap(_taskMap));
    });
    taskList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));

    return taskList;
  }

  Future<int> insertTask(Task task) async {
    Database db = await this.db;
    final int result = await db.insert(
      task_table,
      task.toMap(),
    );
    return result;
  }

  Future<int> updateTask(Task task) async {
    Database db = await this.db;
    final int result = await db.update(
      task_table,
      task.toMap(),
      where: '$col_id=?',
      whereArgs: [task.id],
    );

    return result;
  }

  Future<int> deleteTask(Task task) async {
    Database db = await this.db;
    final int result = await db.delete(
      task_table,
      where: '$col_id=?',
      whereArgs: [task.id],
    );

    return result;
  }
}
