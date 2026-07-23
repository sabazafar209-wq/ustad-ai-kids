import 'package:flutter/material.dart';

import '../widgets/achievement_card.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/greeting_header.dart';
import '../widgets/lesson_card.dart';
import '../widgets/stats_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
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

              /// Header
              const GreetingHeader(
                childName: "Ali",
                avatar: "🐱",
              ),

              const SizedBox(height: 30),

              /// Statistics
              Row(
                children: const [
                  StatsCard(
                    icon: Icons.local_fire_department,
                    title: "Streak",
                    value: "12",
                    color: Colors.orange,
                  ),
                  SizedBox(width: 12),
                  StatsCard(
                    icon: Icons.star,
                    title: "XP",
                    value: "560",
                    color: Colors.amber,
                  ),
                  SizedBox(width: 12),
                  StatsCard(
                    icon: Icons.monetization_on,
                    title: "Coins",
                    value: "145",
                    color: Colors.green,
                  ),
                ],
              ),

              const SizedBox(height: 35),

              Text(
                "Continue Learning",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 16),

              const LessonCard(
                emoji: "🧮",
                title: "Mathematics",
                color: Colors.blue,
              ),

              const LessonCard(
                emoji: "📚",
                title: "English",
                color: Colors.red,
              ),

              const LessonCard(
                emoji: "🤖",
                title: "Artificial Intelligence",
                color: Colors.purple,
              ),

              const LessonCard(
                emoji: "💻",
                title: "Coding",
                color: Colors.green,
              ),

              const SizedBox(height: 30),

              Text(
                "Achievements",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    AchievementCard(
                      emoji: "🥇",
                      title: "First Lesson",
                    ),
                    SizedBox(width: 12),
                    AchievementCard(
                      emoji: "🔥",
                      title: "7 Day Streak",
                    ),
                    SizedBox(width: 12),
                    AchievementCard(
                      emoji: "⭐",
                      title: "500 XP",
                    ),
                    SizedBox(width: 12),
                    AchievementCard(
                      emoji: "🏆",
                      title: "Top Learner",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}