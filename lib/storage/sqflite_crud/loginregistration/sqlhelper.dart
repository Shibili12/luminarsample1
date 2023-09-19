import 'package:sqflite/sqflite.dart' as sql;

class Sqlhelper2 {
  static Future<sql.Database> createDB() async {
    return sql.openDatabase('myusers.db', version: 1,
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

  static Future<List<Map>> checklogin(String user, String pass) async {
    final db = await Sqlhelper2.createDB();
    print(user.toString());
    final data = await db.rawQuery(
        "SELECT * FROM users WHERE uname = '$user' AND pass = '$pass'");
    print(data.toString());
    if (data.isNotEmpty) {
      return data;
    }
    return data;
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = await Sqlhelper2.createDB();
    final data = db.rawQuery("SELECT * FROM users");
    return data;
  }

  static Future<void> deleteuser(int id)async {
    final db = await Sqlhelper2.createDB();
    try {
      await db.delete('users', where: 'id=?', whereArgs: [id]);
    } catch (e) {
      throw Exception();
    }
  
  }
}
