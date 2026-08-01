class AchievementModel {
  final String id;
  final String title;
  final String description;
  final String emoji;
  final bool unlocked;
  final String? unlockedAt;

  AchievementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.emoji,
    required this.unlocked,
    this.unlockedAt,
  });

  AchievementModel copyWith({
    String? id,
    String? title,
    String? description,
    String? emoji,
    bool? unlocked,
    String? unlockedAt,
  }) {
    return AchievementModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      emoji: emoji ?? this.emoji,
      unlocked: unlocked ?? this.unlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'emoji': emoji,
        'unlocked': unlocked,
        'unlockedAt': unlockedAt,
      };

  factory AchievementModel.fromJson(Map<String, dynamic> json) => AchievementModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        emoji: json['emoji'],
        unlocked: json['unlocked'] == true,
        unlockedAt: json['unlockedAt'],
      );
}
