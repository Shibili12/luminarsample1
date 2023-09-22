import 'package:hive_flutter/hive_flutter.dart';
import 'package:luminarsample1/storage/hive_crud/adapters_hive/models/usermodel.dart';

class HiveDb {
  HiveDb.internal();

  static HiveDb instance = HiveDb.internal();

  factory HiveDb() {
    //factory constructor for creating singleton class
    return instance; //this classs have only one instance
  }

  //add user details

  Future<void> adduser(User user) async {
    final db = await Hive.openBox<User>('userdata');
    db.put(user.id, user);
  }

  // read userdata from hivedb
  Future<List<User>> getuser() async {
    final db = await Hive.openBox<User>('userdata');
    return db.values.toList();
  }
}
