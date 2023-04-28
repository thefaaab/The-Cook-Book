import 'package:cookbook/providers/auth_provider.dart';
import 'package:cookbook/screens/home_screen.dart';
import 'package:cookbook/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

class CookbookSplashScreen extends StatelessWidget {
  const CookbookSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = context.watch<AuthProvider>();

    // ap.addListener(() {
    //   print(ap.isSignedIn);
    // });
    return Scaffold(
      body: SplashScreen.navigate(
        name: 'assets/new_file.riv',
        next: (_) => ap.isSignedIn ? const HomeScreen() : const WelcomeScreen(),
        until: () => Future.delayed(const Duration(seconds: 3)),
        startAnimation: 'Timeline 1',
      ),
    );
  }
}
