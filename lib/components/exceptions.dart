class DatabaseError implements Exception {
  DatabaseError();
  String err(message) =>
      'It isn`t be able to establish database conn: $message';
}
