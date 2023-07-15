import 'package:crud_flutter/components/exceptions.dart';
import 'package:crud_flutter/plugins/database.dart';

class MenuRepository {
  Database db = Database(DatabaseError());

  MenuRepository(this.db);

  void close() {
    db.close();
  }
}
