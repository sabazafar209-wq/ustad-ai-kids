import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'achievement_model.dart';
import 'daily_challenge_model.dart';
import 'local_rewards_storage.dart';
import 'package:ustad_ai_kids/features/progress/presentation/providers/progress_provider.dart';

/// Achievements provider
class AchievementsNotifier extends StateNotifier<List<AchievementModel>> {
  final Ref ref;
  final RewardsLocalStorage _storage = RewardsLocalStorage();

  AchievementsNotifier(this.ref) : super([]) {
    _load();
  }

  Future<void> _load() async {
    final items = await _storage.loadAchievements();
    state = items;
  }

  Future<void> unlock(String id) async {
    final now = DateTime.now().toIso8601String();
    state = state
        .map((a) => a.id == id
            ? a.copyWith(unlocked: true, unlockedAt: now)
            : a)
        .toList();
    await _storage.saveAchievements(state);
  }
}

final achievementsProvider =
    StateNotifierProvider<AchievementsNotifier, List<AchievementModel>>(
  (ref) => AchievementsNotifier(ref),
);

/// Daily challenges provider
class DailyChallengesNotifier extends StateNotifier<List<DailyChallengeModel>> {
  final Ref ref;
  final RewardsLocalStorage _storage = RewardsLocalStorage();

  DailyChallengesNotifier(this.ref) : super([]) {
    _load();
  }

  Future<void> _load() async {
    final items = await _storage.loadDailyChallenges();
    state = items;
  }

  Future<void> complete(String id) async {
    final now = DateTime.now().toIso8601String();
    DailyChallengeModel? completed;

    state = state.map((c) {
      if (c.id == id && !c.completed) {
        completed = c.copyWith(completed: true, completedAt: now);
        return completed!;
      }
      return c;
    }).toList();

    await _storage.saveDailyChallenges(state);

    // award progress (xp + coins)
    if (completed != null) {
      final progressNotifier = ref.read(progressProvider.notifier);
      await progressNotifier.addRewards(
        xp: completed!.xpReward,
        coins: completed!.coinsReward,
      );
    }
  }

  Future<void> resetAll() async {
    final reset = state
        .map((c) => c.copyWith(completed: false, completedAt: null))
        .toList();
    state = reset;
    await _storage.saveDailyChallenges(state);
  }
}

final dailyChallengesProvider =
    StateNotifierProvider<DailyChallengesNotifier, List<DailyChallengeModel>>(
  (ref) => DailyChallengesNotifier(ref),
);
