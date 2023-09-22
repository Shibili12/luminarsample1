import 'package:hive_flutter/hive_flutter.dart';

part 'usermodel.g.dart';
@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String password;

  @HiveField(2)
  String? id;
  User({required this.username, required this.password}) {
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}
