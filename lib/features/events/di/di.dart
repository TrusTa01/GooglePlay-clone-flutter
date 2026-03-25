import 'package:google_play/features/events/domain/usecases/build_event_screen_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di.g.dart';

@Riverpod(keepAlive: true)
BuildEventScreenUseCase buildEventScreenUseCase(Ref ref) =>
    const BuildEventScreenUseCase();
