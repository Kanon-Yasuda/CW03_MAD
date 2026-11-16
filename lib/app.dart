import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

StreamBuilder<User?>(
  stream: FirebaseAuth.instance.authStateChanges(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    final user = snapshot.data;
    return user == null
        ? const SignInScreen()
        : ChallengeScreen(user: user, onComplete: onComplete);
  },
)