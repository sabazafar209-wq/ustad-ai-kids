import '../../domain/models/lesson_content.dart';

class LessonRepository {
  List<LessonContent> getLessons() {
    return const [
      LessonContent(
        subject: "Math",
        title: "Addition Basics",
        description: "Learn how to add small numbers.",
        objectives: [
          "Count objects",
          "Understand + symbol",
          "Solve simple addition",
        ],
        duration: 10,
      ),

      LessonContent(
        subject: "English",
        title: "Alphabet Fun",
        description: "Learn English letters and sounds.",
        objectives: [
          "Recognize letters",
          "Pronounce correctly",
          "Match letters",
        ],
        duration: 8,
      ),

      LessonContent(
        subject: "Coding",
        title: "What is Coding?",
        description: "Understand programming basics.",
        objectives: [
          "Algorithms",
          "Instructions",
          "Simple Logic",
        ],
        duration: 12,
      ),

      LessonContent(
        subject: "Science",
        title: "Plants Around Us",
        description: "Discover the world of plants.",
        objectives: [
          "Roots",
          "Leaves",
          "Flowers",
        ],
        duration: 10,
      ),

      LessonContent(
        subject: "AI",
        title: "Meet Artificial Intelligence",
        description: "Understand how AI helps people.",
        objectives: [
          "What is AI?",
          "Examples",
          "Safety",
        ],
        duration: 12,
      ),

      LessonContent(
        subject: "Art",
        title: "Colors and Shapes",
        description: "Explore creativity.",
        objectives: [
          "Primary colors",
          "Shapes",
          "Drawing",
        ],
        duration: 9,
      ),

      LessonContent(
        subject: "Music",
        title: "Musical Notes",
        description: "Introduction to rhythm.",
        objectives: [
          "Beat",
          "Rhythm",
          "Notes",
        ],
        duration: 8,
      ),

      LessonContent(
        subject: "Geography",
        title: "Our Earth",
        description: "Learn about continents and oceans.",
        objectives: [
          "Continents",
          "Oceans",
          "Maps",
        ],
        duration: 11,
      ),
    ];
  }
}