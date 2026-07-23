class ChildProfile {
  final String id;
  final String name;
  final String avatar;
  final int age;
  final String grade;
  final List<String> interests;

  final int xp;
  final int coins;
  final int streak;
  final int level;

  const ChildProfile({
    required this.id,
    required this.name,
    required this.avatar,
    required this.age,
    required this.grade,
    required this.interests,
    this.xp = 0,
    this.coins = 0,
    this.streak = 0,
    this.level = 1,
  });

  ChildProfile copyWith({
    String? id,
    String? name,
    String? avatar,
    int? age,
    String? grade,
    List<String>? interests,
    int? xp,
    int? coins,
    int? streak,
    int? level,
  }) {
    return ChildProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      age: age ?? this.age,
      grade: grade ?? this.grade,
      interests: interests ?? this.interests,
      xp: xp ?? this.xp,
      coins: coins ?? this.coins,
      streak: streak ?? this.streak,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'age': age,
      'grade': grade,
      'interests': interests,
      'xp': xp,
      'coins': coins,
      'streak': streak,
      'level': level,
    };
  }

  factory ChildProfile.fromJson(Map<String, dynamic> json) {
    return ChildProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      age: json['age'] as int,
      grade: json['grade'] as String,
      interests: List<String>.from(json['interests']),
      xp: json['xp'] ?? 0,
      coins: json['coins'] ?? 0,
      streak: json['streak'] ?? 0,
      level: json['level'] ?? 1,
    );
  }
}