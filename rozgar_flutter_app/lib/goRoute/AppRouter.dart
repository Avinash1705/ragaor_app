import 'package:go_router/go_router.dart';
import 'package:rozgar_flutter_app/features/jobList/JonScreen.dart';
import 'package:rozgar_flutter_app/features/skills/skillsScreen.dart';
import 'package:rozgar_flutter_app/utils/AppConstants.dart';

import '../features/authenticate/LoginScreen.dart';
import '../features/authenticate/ResetPasswordScreen.dart';
import '../features/authenticate/SignUpScreen.dart';
import '../features/spash/SpashScreen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppConstants.splash,
    routes: [

      /// Splash
      GoRoute(
        path: AppConstants.splash,
        builder: (context, state) =>
        const SplashScreen(),
      ),

      /// Login
      GoRoute(
        path: AppConstants.login,
        builder: (context, state) =>
        const LoginScreen(),
      ),

      /// Signup
      GoRoute(
        path: AppConstants.signup,
        builder: (context, state) =>
        const SignUpScreen(),
      ),

      /// Reset Password
      GoRoute(
        path: AppConstants.reset,
        builder: (context, state) =>
        const ResetPasswordScreen(),
      ),

      /// Home
      GoRoute(
        path: AppConstants.jobs,
        builder: (context, state) =>
        const JobScreen(),
      ),
      /// profile
      GoRoute(
        path: AppConstants.skills,
        builder: (context, state) =>
        const SkillsPage(),
      ),
      /// Skills
      GoRoute(
        path: AppConstants.jobs,
        builder: (context, state) =>
        const JobScreen(),
      ), /// Setting
      GoRoute(
        path: AppConstants.jobs,
        builder: (context, state) =>
        const JobScreen(),
      ),
    ],
  );
}