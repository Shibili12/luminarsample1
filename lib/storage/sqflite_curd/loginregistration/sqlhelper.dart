import 'package:sqflite/sqflite.dart' as sql;

class Sqlhelper2 {
  static Future<sql.Database> createDB() async {
    return sql.openDatabase('users.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        uname TEXT,
        pass TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )""");
  }

  static Future<int> create_user(String name, String uname, String pass) async {
    final db = await Sqlhelper2.createDB(); // open database
    final data = {'name': name, 'uname': uname, 'pass': pass};
    //         insert to a particular table with values as map
    final id = await db.insert('users', data);
    return id;
  }

  static Future<List<Map>> checklogin(String username, String password) async {
    final db = await Sqlhelper2.createDB();
    final data = await db.rawQuery(
        "SELECT * FROM users WHERE uname= '$username' AND pass = '$password' ");
    print(data.toString());
    if (data.isNotEmpty) {
      return data;
    }
    return data;
  }
}
