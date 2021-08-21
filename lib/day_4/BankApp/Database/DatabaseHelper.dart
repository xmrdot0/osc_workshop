import 'package:osc_workshop/day_4/BankApp/Models/Account.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper.constructor();
  static DatabaseHelper _instence = DatabaseHelper.constructor();
  factory DatabaseHelper() => _instence;

  Database? _db;
  String dbName = 'bank.db';

  Future<Database> createDatabase() async {
    if (_db != null) return _db!;
    String path = join(await getDatabasesPath(), dbName);
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      //TODO create tables
      db.execute('create table account('
          'accountNum integer primary key autoincrement,'
          'name varchar(50),'
          'username varchar(50),'
          'password varchar(50),'
          'amount float)');
    });
    return _db!;
  }

  Future<int> createAccount(Account account) async {
    Database db = await createDatabase();

    return db.insert('account', {
      'name': account.name,
      'username': account.username,
      'password': account.password,
      'amount': account.amount
    });
  }

  Future<List> getAccount(int accountNum, String password) async {
    Database db = await createDatabase();

    return db.query('account',
        where: 'accountNum = ? and password = ?',
        whereArgs: [accountNum, password]);
  }
}
