class DailyChallengeModel {
  final String id;
  final String title;
  final String description;
  final int xpReward;
  final int coinsReward;
  final bool completed;
  final String? completedAt;

  DailyChallengeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.xpReward,
    required this.coinsReward,
    required this.completed,
    this.completedAt,
  });

  DailyChallengeModel copyWith({
    String? id,
    String? title,
    String? description,
    int? xpReward,
    int? coinsReward,
    bool? completed,
    String? completedAt,
  }) {
    return DailyChallengeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      xpReward: xpReward ?? this.xpReward,
      coinsReward: coinsReward ?? this.coinsReward,
      completed: completed ?? this.completed,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "xpReward": xpReward,
        "coinsReward": coinsReward,
        "completed": completed,
        "completedAt": completedAt,
      };

  factory DailyChallengeModel.fromJson(Map<String, dynamic> json) => DailyChallengeModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        xpReward: json["xpReward"] ?? 0,
        coinsReward: json["coinsReward"] ?? 0,
        completed: json["completed"] == true,
        completedAt: json["completedAt"],
      );
}
