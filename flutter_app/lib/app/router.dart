import 'package:go_router/go_router.dart';
import '../features/dashboard/presentation/pages/dashboard_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../features/welcome/presentation/pages/welcome_page.dart';
import '../features/authentication/presentation/pages/login_page.dart';
import '../features/authentication/presentation/pages/register_page.dart';
import '../features/child/presentation/pages/create_child_page.dart';
import '../features/quiz/presentation/pages/quiz_page.dart';
import 'package:ustad_ai_kids/features/rewards/achievements_page.dart';
import 'package:ustad_ai_kids/features/rewards/daily_challenges_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
   GoRoute(
  path: '/quiz',
  builder: (context, state) => const QuizPage(
    subject: "Math",
  ),
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