import 'package:my_send/extention/ext_date.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? _database;
List historyOrder = [];

class HistoryOrderDB {
  Future get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('History.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    print("createHistoryDB");
    await db.execute('''
      CREATE TABLE HistoryOrder(
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        itemPhotoPath TEXT NOT NULL,
        alamatPenjemputan TEXT NOT NULL,
        alamatTujuan TEXT NOT NULL,
        jarakPengiriman TEXT NOT NULL,
        createdAt TEXT NOT NULL
      )

      ''');
  }

  Future addDataLocally({title, itemPhotoPath, alamatPenjemputan, alamatTujuan, jarakPengiriman}) async {
    final db = await database;
    await db.insert(
      "HistoryOrder",
      {"title": title, "itemPhotoPath": itemPhotoPath, "alamatPenjemputan": alamatPenjemputan, "alamatTujuan": alamatTujuan, "jarakPengiriman": jarakPengiriman, "createdAt": DateTime.now().toDateHuman()},
    );
    print("New History Added");
    return "added";
  }

  Future readAllData() async {
    final db = await database;
    final allData = await db!.query("HistoryOrder");
    historyOrder = allData;
    print(historyOrder);
    return "History Data Readed";
  }

  Future deleteAllData() async {
    deleteDatabase("History.db");
    readAllData();
    return "History Deleted";
  }

  Future filterByDate() async {}
  // Future updateMyData({username, password, name, noKTP, photoPath, id}) async {
  //   print(username);
  //   print(password);
  //   print(name);
  //   print(noKTP);
  //   print(photoPath);
  //   final db = await database;
  //   final dbupdateid = await db.rawUpdate('''
  //     UPDATE Localdata
  //     SET
  //     username=?,
  //     password=?,
  //     name=?,
  //     noKTP=?,
  //     photoPath=?
  //     WHERE id=?''', [username, password, name, noKTP, photoPath, id]);
  //   return dbupdateid;
  // }

  // Future<void> delete(int id) async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Remove the Dog from the database.
  //   await db.delete(
  //     "Localdata",
  //     where: 'id = ?',
  //     // Pass the Dog's id as a whereArg to prevent SQL injection.
  //     whereArgs: [id],
  //   );
  // }
}

// profile model ////////////////////////////////

// class ProfileModel {
//   int? id;
//   String? name, username, password, noKTP, photoPath, createdAt, updatedAt;

//   ProfileModel({this.id, this.name, this.username, this.password, this.noKTP, this.photoPath, this.createdAt, this.updatedAt});

//   factory ProfileModel.fromJson(Map<String, dynamic> json){
//     return ProfileModel(
//       id:  json['id'],
//       username: json['username'],
//       password: json['password'],
//       name: json['name'],
//       noKTP: json['noKTP'],
//       photoPath: json['photoPath'],
//       createdAt: json['created_At'],
//       updatedAt: json['updated_At'],
//     );
//   }
// }

/////////////////////////////////////////////// DB INSTANCE /////////////////////////
///
///// import 'dart:io';
// import 'package:my_send/profile_model.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseInstance {
//   final String _databaseName = 'my_database.db';
//   final int _databaseVersion = 1;

//   //Profile Table
//   final String table = 'profile';
//   final String id = 'id';
//   final String username = 'username';
//   final String password = 'password';
//   final String name = 'name';
//   final String noKTP = 'noKTP';
//   final String photoPath = 'photoPath';
//   final String createdAt = 'created_At';
//   final String updatedAt = 'updated_At';

//   Database? _database;
//   Future<Database> database() async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, _databaseName);
//     return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute('CREATE TABLE $table ($id INTEGER PRIMARY KEY, $name TEXT, $username TEXT, $password TEXT, $name TEXT, $noKTP TEXT, $photoPath NULL, $createdAt TEXT, $updatedAt TEXT)');
//   }

//   Future<List<ProfileModel>> all() async {
//     final data = await _database!.query(table);
//     List<ProfileModel> result =
//         data.map((e) => ProfileModel.fromJson(e)).toList();
//         print(result);
//     return result;
//   }

//   Future<int> insert(Map<String, dynamic> row) async {
//     final query = await _database!.insert(table, row);
//     return query;
//   }
// }
