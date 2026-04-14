import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rozgar_flutter_app/features/authenticate/ResetPasswordScreen.dart';
import 'package:rozgar_flutter_app/features/spash/SpashScreen.dart';
import 'package:rozgar_flutter_app/goRoute/AppRouter.dart';
import 'package:rozgar_flutter_app/utils/AppTheme.dart';

import 'features/authenticate/SignUpScreen.dart';


void main() {
  runApp(const ProviderScope(child: RozgarApp()));
}

class RozgarApp extends StatelessWidget {
  const RozgarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Rozgar',
      theme: AppTheme.lightTheme,
    );
  }
}


