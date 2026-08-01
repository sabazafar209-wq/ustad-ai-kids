import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/progress_model.dart';

class ProgressNotifier extends StateNotifier<ProgressModel> {
  ProgressNotifier()
      : super(
          const ProgressModel(
            xp: 0,
            coins: 0,
            streak: 1,
            completedLessons: 0,
          ),
        );

  void completeLesson(int earnedXP) {
    state = state.copyWith(
      xp: state.xp + earnedXP,
      coins: state.coins + 10,
      completedLessons: state.completedLessons + 1,
    );
  }
}

final progressProvider =
    StateNotifierProvider<ProgressNotifier, ProgressModel>(
  (ref) => ProgressNotifier(),
);