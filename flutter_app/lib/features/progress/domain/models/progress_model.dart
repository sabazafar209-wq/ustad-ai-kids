class ProgressModel {
  final int xp;
  final int coins;
  final int streak;
  final int completedLessons;

  const ProgressModel({
    required this.xp,
    required this.coins,
    required this.streak,
    required this.completedLessons,
  });

  ProgressModel copyWith({
    int? xp,
    int? coins,
    int? streak,
    int? completedLessons,
  }) {
    return ProgressModel(
      xp: xp ?? this.xp,
      coins: coins ?? this.coins,
      streak: streak ?? this.streak,
      completedLessons: completedLessons ?? this.completedLessons,
    );
  }
}