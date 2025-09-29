import 'dart:io';
import 'dart:convert';
import 'package:dart_cli_full_banking_system/banking/models/user.dart';

class Storage {
  final String usersFile = 'data/users.json';

  Future<List<User>> readUsers() async {
    final file = File(usersFile);
    if (!await file.exists()) {
      await file.create(recursive: true);
      await file.writeAsString('[]');
    }
    final content = await file.readAsString();
    final List<dynamic> jsonList = jsonDecode(content);
    return jsonList.map((u) => User.fromJson(u)).toList();
  }

  Future<void> saveUsers(List<User> users) async {
    final file = File(usersFile);
    await file.writeAsString(jsonEncode(users.map((u) => u.toJson()).toList()));
  }
}
