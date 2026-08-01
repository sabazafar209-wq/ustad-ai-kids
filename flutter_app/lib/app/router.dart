import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/dashboard/presentation/pages/dashboard_page.dart';
import '../features/lesson/presentation/pages/lesson_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../features/welcome/presentation/pages/welcome_page.dart';
import '../features/authentication/presentation/pages/login_page.dart';
import '../features/authentication/presentation/pages/register_page.dart';
import '../features/child/presentation/pages/create_child_page.dart';
import '../features/quiz/presentation/pages/quiz_page.dart';
import 'package:ustad_ai_kids/features/rewards/achievements_page.dart';
import 'package:ustad_ai_kids/features/rewards/daily_challenges_page.dart';
import '../features/lesson/domain/models/lesson_content.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
   GoRoute(
     path: '/quiz',
     builder: (context, state) {
       final subject = state.extra as String? ?? state.uri.queryParameters['subject'] ?? 'Math';
       return QuizPage(subject: subject);
     },
   ),
   GoRoute(
     path: '/lesson',
     builder: (context, state) {
       final lesson = state.extra as LessonContent?;
       if (lesson == null) {
         return const Scaffold(
           body: Center(
             child: Text('Lesson not found.'),
           ),
         );
       }
       return LessonPage(lesson: lesson);
     },
   ),
   GoRoute(
     path: '/welcome',
     builder: (context, state) => const WelcomePage(),
   ),

    // NEW ROUTE
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),

    // NEW ROUTE
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),

    // NEW ROUTE
    GoRoute(
      path: '/create-child',
      builder: (context, state) => const CreateChildPage(),
    ),
    GoRoute(
  path: '/dashboard',
  builder: (context, state) => const DashboardPage(),
),

    // Rewards routes
    GoRoute(
      path: '/achievements',
      builder: (context, state) => const AchievementsPage(),
    ),
    GoRoute(
      path: '/daily-challenges',
      builder: (context, state) => const DailyChallengesPage(),
    ),

  ],
);