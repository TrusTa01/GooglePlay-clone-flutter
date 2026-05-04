import 'package:google_play/core/local_database/app_database.dart';

abstract class BaseDriftWriter<DTO> {
  final AppDatabase db;
  const BaseDriftWriter(this.db);

  Future<void> upsertAll(List<DTO> dtos) async {
    if (dtos.isEmpty) return;
    await db.transaction(() async {
      for (final dto in dtos) {
        await upsertOne(dto);
      }
    });
  }

  Future<void> upsertOne(DTO dto);
}
