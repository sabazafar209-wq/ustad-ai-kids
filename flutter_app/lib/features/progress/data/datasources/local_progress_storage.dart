import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/progress_model.dart';

class LocalProgressStorage {
  static const _key = "progress";

  Future<void> saveProgress(ProgressModel progress) async {
    final prefs = await SharedPreferences.getInstance();

    final data = {
      "xp": progress.xp,
      "coins": progress.coins,
      "streak": progress.streak,
      "completedLessons": progress.completedLessons,
    };

    await prefs.setString(_key, jsonEncode(data));
  }

  Future<ProgressModel> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();

    final json = prefs.getString(_key);

    if (json == null) {
      return const ProgressModel(
        xp: 0,
        coins: 0,
        streak: 1,
        completedLessons: 0,
      );
    }

    final map = jsonDecode(json);

    return ProgressModel(
      xp: map["xp"],
      coins: map["coins"],
      streak: map["streak"],
      completedLessons: map["completedLessons"],
    );
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}