class LessonContent {
  final String subject;
  final String title;
  final String description;
  final List<String> objectives;
  final int duration;

  const LessonContent({
    required this.subject,
    required this.title,
    required this.description,
    required this.objectives,
    required this.duration,
  });
}