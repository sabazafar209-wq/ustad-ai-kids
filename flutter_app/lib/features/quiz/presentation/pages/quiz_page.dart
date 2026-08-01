import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ustad_ai_kids/core/navigation/navigation_helper.dart';
import 'package:ustad_ai_kids/core/navigation/standard_app_bar.dart';

import '../../../progress/presentation/providers/progress_provider.dart';
import '../../data/repositories/quiz_repository.dart';
import '../../domain/models/question.dart';

class QuizPage extends ConsumerStatefulWidget {
  final String subject;

  const QuizPage({
    super.key,
    required this.subject,
  });

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  late final List<Question> questions;

  int currentQuestion = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    questions = QuizRepository().getQuestions(widget.subject);
  }

  void answerQuestion(int selectedIndex) {
    final question = questions[currentQuestion];

    if (selectedIndex == question.correctAnswer) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
      return;
    }

    ref.read(progressProvider.notifier).completeLesson(20);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: const Text("🎉 Quiz Finished"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You scored $score out of ${questions.length}",
            ),
            const SizedBox(height: 16),
            const Text(
              "⭐ +20 XP",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              "🪙 +10 Coins",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              NavigationHelper.replace(context, '/dashboard');
            },
            child: const Text("Done"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      appBar: StandardAppBar(
        title: '${widget.subject} Quiz',
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (currentQuestion + 1) / questions.length,
            ),
            const SizedBox(height: 30),
            Text(
              "Question ${currentQuestion + 1} of ${questions.length}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            Text(
              question.question,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 30),
            ...question.options.asMap().entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => answerQuestion(entry.key),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(entry.value),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}