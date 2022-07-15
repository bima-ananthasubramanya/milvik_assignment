import 'package:milvik_project/models/doctor_details.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class DBHelper{

  static Future<Database> initDB() async {
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, 'doctor_details.db');
    return await openDatabase(path,version: 1,onCreate: _onCreate);
  }


  static Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE doctor_details(id INTEGER PRIMARY KEY, firstName TEXT,lastName TEXT, profilePic TEXT,primaryContactNo TEXT, rating REAL,emailAddress TEXT, qualification TEXT,description TEXT,specialization TEXT )',
    );
  }

  static Future<int> createDoctors(Doctor doctordB) async {
    Database db = await DBHelper.initDB();
    return await db.insert('doctor_details', doctordB.toJson());
  }

  static Future<List<Doctor>> readDoctors() async {
    Database db = await DBHelper.initDB();
    var doctordB = await db.query('doctordB', orderBy: 'name');
    List<Doctor> doctorList = doctordB.isNotEmpty
    ? doctordB.map((details) => Doctor.fromJson(details)).toList() : [];
    return doctorList;
  }

  static Future<int> updateDoctors(Doctor doctordB) async {
    Database db = await DBHelper.initDB();
    return await db.update('doctordB', doctordB.toJson(),where: 'id = ?', whereArgs: [doctordB.id]);
  }

  static Future<int> deleteDoctors(int id) async {
    Database db = await DBHelper.initDB();
    return await db.delete('doctordB', where: 'id = ?',whereArgs: [id]);
  }
}