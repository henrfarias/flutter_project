import 'package:crud_flutter/components/exceptions.dart';
import 'package:crud_flutter/interfaces/user.dart';
import 'package:crud_flutter/plugins/database.dart';

class UserRepository {
  Database db = Database(DatabaseError());

  UserRepository();

  void close() {
    db.close();
  }

  List<User> mapToUsers(dynamic result) {
    if (result is List) {
      return result.map((data) {
        Map<String, dynamic> userData = data['users'] ?? {};
        return User(
          id: userData['id'] as int? ?? 0,
          name: userData['name'] as String? ?? '',
          email: userData['email'] as String? ?? '',
          password: userData['password'] as String? ?? '',
        );
      }).toList();
    }

    // If the result is not a List, return an empty list
    return [];
  }

  _callback(count, result) {
    if (count > 0) {
      return mapToUsers(result)[0];
    }
    return null;
  }

  Future<User?> getUser() async {
    var result =
        await db.query('SELECT * FROM users', _callback, (err) => {print(err)});
    return result;
  }
}
