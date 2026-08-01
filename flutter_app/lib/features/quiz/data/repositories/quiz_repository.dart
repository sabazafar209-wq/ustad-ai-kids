import '../../domain/models/question.dart';

class QuizRepository {
  List<Question> getQuestions(String subject) {
    switch (subject) {
      case "Math":
        return _mathQuestions();

      case "English":
        return _englishQuestions();

      case "Coding":
        return _codingQuestions();

      case "Science":
        return _scienceQuestions();

      case "AI":
        return _aiQuestions();

      case "Art":
        return _artQuestions();

      case "Music":
        return _musicQuestions();

      case "Geography":
        return _geographyQuestions();

      default:
        return _mathQuestions();
    }
  }

  List<Question> _mathQuestions() {
    return const [
      Question(
        question: "What is 2 + 3?",
        options: ["4", "5", "6", "7"],
        correctAnswer: 1,
      ),
      Question(
        question: "What is 5 + 4?",
        options: ["8", "9", "10", "11"],
        correctAnswer: 1,
      ),
      Question(
        question: "What is 10 - 4?",
        options: ["5", "6", "7", "8"],
        correctAnswer: 1,
      ),
    ];
  }

  List<Question> _englishQuestions() {
    return const [
      Question(
        question: "Which letter comes after A?",
        options: ["B", "C", "D", "E"],
        correctAnswer: 0,
      ),
      Question(
        question: "Which word is a fruit?",
        options: ["Apple", "Chair", "Table", "Car"],
        correctAnswer: 0,
      ),
      Question(
        question: "Which word is an animal?",
        options: ["Dog", "Book", "Pencil", "Cup"],
        correctAnswer: 0,
      ),
    ];
  }

  List<Question> _codingQuestions() {
    return const [
      Question(
        question: "A computer follows...",
        options: [
          "Instructions",
          "Dreams",
          "Magic",
          "Luck",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "Which one is used for programming?",
        options: [
          "Code",
          "Pizza",
          "Shoes",
          "Cloud",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "Coding helps us create...",
        options: [
          "Apps",
          "Trees",
          "Mountains",
          "Rivers",
        ],
        correctAnswer: 0,
      ),
    ];
  }

  List<Question> _scienceQuestions() {
    return const [
      Question(
        question: "Plants need...",
        options: [
          "Water",
          "Plastic",
          "Glass",
          "Paper",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "The Sun is a...",
        options: [
          "Star",
          "Planet",
          "Moon",
          "Cloud",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "Humans breathe...",
        options: [
          "Oxygen",
          "Chocolate",
          "Juice",
          "Sand",
        ],
        correctAnswer: 0,
      ),
    ];
  }

  List<Question> _aiQuestions() {
    return const [
      Question(
        question: "AI stands for...",
        options: [
          "Artificial Intelligence",
          "Amazing Internet",
          "Auto Image",
          "Active Ice",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "AI can help...",
        options: [
          "Solve problems",
          "Eat food",
          "Sleep",
          "Swim",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "ChatGPT is an example of...",
        options: [
          "AI",
          "Car",
          "Animal",
          "Planet",
        ],
        correctAnswer: 0,
      ),
    ];
  }

  List<Question> _artQuestions() {
    return const [
      Question(
        question: "Red and Blue are...",
        options: [
          "Colors",
          "Animals",
          "Foods",
          "Cities",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "We use a brush for...",
        options: [
          "Painting",
          "Cooking",
          "Running",
          "Reading",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "A circle is a...",
        options: [
          "Shape",
          "Fruit",
          "Bird",
          "Country",
        ],
        correctAnswer: 0,
      ),
    ];
  }

  List<Question> _musicQuestions() {
    return const [
      Question(
        question: "Music has...",
        options: [
          "Rhythm",
          "Bricks",
          "Wheels",
          "Leaves",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "Which is a musical instrument?",
        options: [
          "Piano",
          "Table",
          "Window",
          "Spoon",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "Songs are made of...",
        options: [
          "Notes",
          "Stones",
          "Clouds",
          "Cars",
        ],
        correctAnswer: 0,
      ),
    ];
  }

  List<Question> _geographyQuestions() {
    return const [
      Question(
        question: "Earth is a...",
        options: [
          "Planet",
          "Fish",
          "Tree",
          "Flower",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "Which one is an ocean?",
        options: [
          "Pacific",
          "Sahara",
          "Everest",
          "Amazon",
        ],
        correctAnswer: 0,
      ),
      Question(
        question: "We live on...",
        options: [
          "Earth",
          "Moon",
          "Mars",
          "Sun",
        ],
        correctAnswer: 0,
      ),
    ];
  }
}