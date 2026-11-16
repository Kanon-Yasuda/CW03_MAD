import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CloudQuestApp());
}

class CloudQuestApp extends StatelessWidget {
  const CloudQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CloudQuestHome(),
    );
  }
}

class CloudQuestHome extends StatelessWidget {
  const CloudQuestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cloud Quest')),
      body: const Center(child: Text('Welcome to Cloud Quest!')),
    );
  }
}