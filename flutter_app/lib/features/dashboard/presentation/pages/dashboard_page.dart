import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../child/presentation/providers/child_provider.dart';
import '../../../progress/presentation/providers/progress_provider.dart';
import 'package:ustad_ai_kids/features/rewards/rewards_providers.dart';

import '../widgets/achievement_card.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/greeting_header.dart';
import '../widgets/lesson_card.dart';
import '../widgets/stats_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final child = ref.watch(childProvider);
    final progress = ref.watch(progressProvider);

    if (child == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: const DashboardBottomNav(
        currentIndex: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Greeting
              GreetingHeader(
                childName: child.name,
                avatar: child.avatar,
              ),

              const SizedBox(height: 30),

              /// Statistics
              Row(
                children: [
                  StatsCard(
                    icon: Icons.local_fire_department,
                    title: "Streak",
                    value: progress.streak.toString(),
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 12),
                  StatsCard(
                    icon: Icons.star,
                    title: "XP",
                    value: progress.xp.toString(),
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 12),
                  StatsCard(
                    icon: Icons.monetization_on,
                    title: "Coins",
                    value: progress.coins.toString(),
                    color: Colors.green,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Level & Achievements summary
              Row(
                children: [
                  StatsCard(
                    icon: Icons.emoji_events,
                    title: "Level",
                    value: ((progress.xp ~/ 100) + 1).toString(),
                    color: Colors.purple,
                  ),
                  const SizedBox(width: 12),
                  Consumer(builder: (context, ref2, _) {
                    final achievements = ref2.watch(achievementsProvider);
                    final unlocked = achievements.where((a) => a.unlocked).length;
                    return StatsCard(
                      icon: Icons.lock_open,
                      title: "Unlocked",
                      value: unlocked.toString(),
                      color: Colors.blueGrey,
                    );
                  }),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                "Continue Learning",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 16),

              ...child.interests.map(
                (subject) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: LessonCard(
                    emoji: _emoji(subject),
                    title: subject,
                    color: Colors.blue,
                    onTap: () {
                      context.go("/quiz");
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "Achievements",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 150,
                child: Consumer(builder: (context, ref2, _) {
                  final achievements = ref2.watch(achievementsProvider);

                  if (achievements.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // show up to 4 achievement cards
                  final preview = achievements.take(4).toList();

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: preview.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final a = preview[index];
                      return AchievementCard(
                        emoji: a.emoji,
                        title: a.title,
                      );
                    },
                  );
                }),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.go('/achievements');
                    },
                    child: const Text('View Achievements'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/daily-challenges');
                    },
                    child: const Text('Daily Challenges'),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  String _emoji(String subject) {
    switch (subject) {
      case "Math":
        return "🧮";
      case "English":
        return "📚";
      case "Coding":
        return "💻";
      case "Science":
        return "🔬";
      case "AI":
        return "🤖";
      case "Art":
        return "🎨";
      case "Music":
        return "🎵";
      case "Geography":
        return "🌍";
      default:
        return "📘";
    }
  }
}