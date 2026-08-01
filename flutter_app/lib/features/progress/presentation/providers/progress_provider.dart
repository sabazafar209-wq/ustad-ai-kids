import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/progress_model.dart';
import '../../data/datasources/local_progress_storage.dart';

class ProgressNotifier extends StateNotifier<ProgressModel> {
  final LocalProgressStorage _storage = LocalProgressStorage();

  ProgressNotifier()
      : super(
          const ProgressModel(
            xp: 0,
            coins: 0,
            streak: 1,
            completedLessons: 0,
          ),
        ) {
    _load();
  }

  Future<void> _load() async {
    final saved = await _storage.loadProgress();
    state = saved;
  }

  Future<void> completeLesson(int earnedXP) async {
    state = state.copyWith(
      xp: state.xp + earnedXP,
      coins: state.coins + 10,
      completedLessons: state.completedLessons + 1,
    );

    await _storage.saveProgress(state);
  }
}

final progressProvider =
    StateNotifierProvider<ProgressNotifier, ProgressModel>(
  (ref) => ProgressNotifier(),
);