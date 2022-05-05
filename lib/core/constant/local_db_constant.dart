class LocalDBConstant {
  static const dbVersion = 1;

  static const dbPassword = "db_pass_0000111";

  static const initialScript = 'assets/sql/initial.sql';

  static String migrationForVersion(int version) {
    return 'assets/migration_$version.sql';
  }

  // MARK: - TABLE

  static const tableTodo = 'TODO';

  static const dbTableList = [
    tableTodo,
  ];
}
