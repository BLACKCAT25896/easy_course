import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService{
  static Database? _db;
  static final DatabaseService instance =  DatabaseService._constructor();
  final String tableName = "product";
  final String id = "id";
  final String name = "name";
  final String image = "image";
  final String purchasePrice = "purchase_price";
  final String sellPrice = "sell_price";


  DatabaseService._constructor();


  Future<Database?> get database async {
    _db ??= await instance.getDatabase();
    return _db;
  }


  Future<Database> getDatabase() async {
    var databasesPathDir = await getDatabasesPath();
    String databasePath = join(databasesPathDir, 'master.db');
    final database =  openDatabase(databasePath, onCreate: (db, version){
      db.execute(
        '''
        CREATE TABLE $tableName(
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        $name TEXT NOT NULL,
        $image REAL NULL
        $purchasePrice REAL NOT NULL,
        $sellPrice REAL NOT NULL
        '''
      );
    });
    return database;
  }
}