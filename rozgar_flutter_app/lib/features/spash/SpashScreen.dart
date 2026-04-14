import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rozgar_flutter_app/features/jobList/JonScreen.dart';
import 'package:rozgar_flutter_app/utils/AppConstants.dart';


/// SPLASH SCREEN
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
    context.go(AppConstants.login);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildDot(double top, double left) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: 4,
        width: 4,
        decoration: const BoxDecoration(
          color: Colors.white70,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff0057ff),
              Color(0xff4b8dff),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            /// floating dots
            buildDot(120, 80),
            buildDot(200, 250),
            buildDot(400, 40),
            buildDot(600, 300),
            buildDot(700, 100),

            Center(
              child: FadeTransition(
                opacity: fadeAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Logo
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius:
                        BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.keyboard_double_arrow_up,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// App Name
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Rozgar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "Setu",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 34,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Turning Potential into Opportunity",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Bottom Loader
            Positioned(
              bottom: 70,
              left: 40,
              right: 40,
              child: Column(
                children: [
                  LinearProgressIndicator(
                    minHeight: 3,
                    backgroundColor:
                    Colors.white24,
                    valueColor:
                    const AlwaysStoppedAnimation(
                      Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "LOADING...",
                    style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 4,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

