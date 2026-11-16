import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final user = snapshot.data;
          if (user == null) {
            return const SignInScreen();
          }
          return ChallengeScreen(user: user, onComplete: onComplete);
        },
      ),
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => FirebaseAuth.instance.signInAnonymously(),
          child: const Text('Sign in'),
        ),
      ),
    );
  }
}

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({
    super.key,
    required this.user,
    required this.onComplete,
  });

  final User user;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: onComplete,
          child: const Text('Complete challenge'),
        ),
      ),
    );
  }
}