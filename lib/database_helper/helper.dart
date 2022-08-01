import 'package:flutter/cupertino.dart';
import 'package:milvik_project/models/doctor_details.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, 'doctor_details.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future _onCreate(Database db, int version) async {
    var sql = '''CREATE TABLE doctor_details(
    id INTEGER PRIMARY KEY,
    firstName TEXT,
    lastName TEXT,
    profilePic TEXT,
    primaryContactNo TEXT,
    rating TEXT,
    emailAddress TEXT,
    qualification TEXT,
    description TEXT,
    specialization TEXT,
    languagesKnown TEXT
    )''';
    await db.execute(sql);
  }

  static Future<int> createDoctors(Doctor doctor) async {
    Database db = await DBHelper.initDB();
    return await db.insert('doctor_details', doctor.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> saveListOfDoctors(Doctor doctor) async {
    Database db = await DBHelper.initDB();
    try {
      await db.insert('doctor_details', doctor.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e, s) {
      print(s);
    }
  }

  static Future<List<Doctor>> readDoctors() async {
    Database db = await DBHelper.initDB();
    var listOfDoctors = await db.query('doctor_details', orderBy: 'firstName');
    List<Doctor> doctorList = listOfDoctors.isNotEmpty
        ? listOfDoctors.map((details) => Doctor.fromJson(details)).toList()
        : [];
    return doctorList;
  }

  static Future<int> updateDoctors(Doctor doctor) async {
    Database db = await DBHelper.initDB();
    return await db.update('doctor_details', doctor.toJson(),
        where: 'id = ?', whereArgs: [doctor.id]);
  }

  static Future<int> deleteDoctors(int id) async {
    Database db = await DBHelper.initDB();
    return await db.delete('doctor_details', where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> deleteAllEmployees() async {
    Database db = await DBHelper.initDB();
    final delete = await db.rawDelete('SELECT * FROM doctor_details');
    return delete;
  }
}
