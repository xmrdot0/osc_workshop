import 'package:osc_workshop/day_5/assignment_socialmedia_app/Models/account.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper.constructor();
  static DatabaseHelper _instence = DatabaseHelper.constructor();
  factory DatabaseHelper() => _instence;

  Database? _db;
  String dbName = 'sma.db';

  Future<Database> createDatabase() async {
    if (_db != null) return _db!;
    String path = join(await getDatabasesPath(), dbName);
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      //TODO create tables
      db.execute('create table account('
          'id integer primary key autoincrement,'
          'email varchar(50),'
          'userName varchar(50),'
          'password varchar(50),');
    });
    return _db!;
  }

  Future<int> createAccount(Account account) async {
    Database db = await createDatabase();

    return db.insert('account', {
      'email': account.email,
      'userName': account.userName,
      'password': account.password,
    });
  }

  Future<List> getAccount(String email, String password) async {
    Database db = await createDatabase();

    return db.query('account',
        where: 'email = ? and password = ?', whereArgs: [email, password]);
  }
}







// import 'package:osc_workshop/day_5/assignment_socialmedia_app/Models/account.dart';
// import 'package:osc_workshop/day_5/assignment_socialmedia_app/Models/post.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   DatabaseHelper.constructor();
//   static DatabaseHelper _instance = DatabaseHelper.constructor();
//   factory DatabaseHelper() => _instance;

//   Database? _db;
//   String dbName = 'socialmedia.db';

//   Future<Database> initDatabase() async {
//     if (_db != null) return _db!;
//     print("help");
//     String path = join(await getDatabasesPath(), dbName);
//     _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
//       db.execute('create table accounts('
//           'id integer primary key autoincrement,'
//           'userName varchar(50),'
//           'password varchar(50),');
//     });
//     print("database inited");
//     return _db!;
//   }

//   // Listing all posts

//   Future<List> getPosts() async {
//     Database db = await initDatabase();
//     return db.query('posts');
//   }

//   // Creating new account
//   Future<int> createAccount(Account account) async {
//     Database db = await initDatabase();
//     print("Excuted");
//     return db.insert('accounts', {
//       'userName': account.userName,
//       'email': account.email,
//       'password': account.password
//     });
//   }

//   // Check if account exists and return it

//   Future<List> getAccount(String email, String password) async {
//     Database db = await initDatabase();

//     return db.query('accounts',
//         where: 'email = ? and password = ?', whereArgs: [email, password]);
//   }
// }
