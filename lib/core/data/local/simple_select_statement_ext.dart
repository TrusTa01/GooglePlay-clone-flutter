import 'package:drift/drift.dart';

extension TablePagination<T extends Table, D> on SimpleSelectStatement<T, D> {
  SimpleSelectStatement<T, D> withPagination(int page, int pageSize) {
    final safePage = page < 1 ? 1 : page;
    final safePageSize = pageSize < 1 ? 20 : pageSize;
    final offset = (safePage - 1) * safePageSize;
    return this..limit(safePageSize, offset: offset);
  }
}
