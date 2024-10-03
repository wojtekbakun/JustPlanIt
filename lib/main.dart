import 'package:calend/features/core/providers/providers.dart';
import 'package:calend/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    AppProviders.initializeProviders(
      child: const JustPlanItApp(),
    ),
  );
}

class JustPlanItApp extends StatelessWidget {
  const JustPlanItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just Plan It',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
      },
      initialRoute: '/',
    );
  }
}
