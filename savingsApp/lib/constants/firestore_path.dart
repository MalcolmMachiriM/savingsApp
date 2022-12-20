class FirestorePath {
  static String get users => 'users';
  static String user(String uid) => '$users/$uid';

  // table
  static String get tables => 'tables';
  static String table(String tableNumber) => '$tables/$tableNumber';
}
