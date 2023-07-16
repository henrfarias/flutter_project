import 'package:crud_flutter/components/exceptions.dart';
import 'package:postgres/postgres.dart';

class Database {
  PostgreSQLConnection? _conn;

  List<Map<String, Map<String, dynamic>>>? _result;
  int? _count;

  Database(DatabaseError exception,
      {String url = '200.19.1.18',
      int port = 5432,
      String db = 'henriquefarias',
      String user = 'henriquefarias',
      String password = '123456'}) {
    try {
      _conn = PostgreSQLConnection(url, port, db,
          queryTimeoutInSeconds: 1,
          timeoutInSeconds: 3,
          username: user,
          password: password);
    } catch (e) {
      exception.err(e.toString());
    }
  }

  close() {
    _conn!.close();
  }

  Future query(String command, Function callback, errorFunction) async {
    try {
      if (_conn!.isClosed) {
        await _conn!.open();
      }
      _result = null;
      var result = await _conn!.mappedResultsQuery(command);
      _result = result;
      _count = result.length;
      return callback(_count, _result);
    } catch (e) {
      errorFunction(e);
    }
  }
}
