import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'rewards_achievement_model.dart';
import 'rewards_daily_challenge_model.dart';

class RewardsLocalStorage {
  static const _achievementsKey = 'rewards_achievements';
  static const _dailyKey = 'rewards_daily_challenges';

  Future<List<AchievementModel>> loadAchievements() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_achievementsKey);

    if (jsonStr == null) {
      // Provide some default achievements
      final defaults = [
        AchievementModel(
          id: 'first_lesson',
          title: 'First Lesson',
          description: 'Complete your first lesson',
          emoji: '🥇',
          unlocked: false,
        ),
        AchievementModel(
          id: 'seven_day_streak',
          title: '7 Day Streak',
          description: 'Learn 7 days in a row',
          emoji: '🔥',
          unlocked: false,
        ),
        AchievementModel(
          id: 'xp_500',
          title: '500 XP',
          description: 'Earn 500 XP',
          emoji: '⭐',
          unlocked: false,
        ),
        AchievementModel(
          id: 'top_learner',
          title: 'Top Learner',
          description: 'Be among top learners',
          emoji: '🏆',
          unlocked: false,
        ),
      ];

      await saveAchievements(defaults);
      return defaults;
    }

    final list = jsonDecode(jsonStr) as List<dynamic>;
    return list
        .map((e) => AchievementModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveAchievements(List<AchievementModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString(_achievementsKey, jsonStr);
  }

  Future<List<DailyChallengeModel>> loadDailyChallenges() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_dailyKey);

    if (jsonStr == null) {
      final defaults = [
        DailyChallengeModel(
          id: 'daily_1',
          title: 'Quick Quiz',
          description: 'Complete a 5-question quiz',
          xpReward: 20,
          coinsReward: 5,
          completed: false,
        ),
        DailyChallengeModel(
          id: 'daily_2',
          title: 'Read a Story',
          description: 'Listen to a short story',
          xpReward: 10,
          coinsReward: 3,
          completed: false,
        ),
        DailyChallengeModel(
          id: 'daily_3',
          title: 'Practice Coding',
          description: 'Solve a coding mini-task',
          xpReward: 30,
          coinsReward: 8,
          completed: false,
        ),
      ];

      await saveDailyChallenges(defaults);
      return defaults;
    }

    final list = jsonDecode(jsonStr) as List<dynamic>;
    return list
        .map((e) => DailyChallengeModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveDailyChallenges(List<DailyChallengeModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString(_dailyKey, jsonStr);
  }
}
