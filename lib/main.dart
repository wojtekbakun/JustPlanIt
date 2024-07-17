import 'package:calend/colors.dart';
import 'package:calend/utils/step_radio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calend/pages/dashboard.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const Providers(),
  );
}

class Providers extends StatelessWidget {
  const Providers({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RadioStep()),
      ],
      child: const JustPlanItApp(),
    );
  }
}

class JustPlanItApp extends StatelessWidget {
  const JustPlanItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just Plan It',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.blueD60,
        colorScheme: ColorScheme(
          primary: AppColors.blueD60,
          secondary: Colors.green,
          surface: AppColors.backgroundDark,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onError: Colors.white,
          brightness: Brightness.light,
          surfaceContainer: AppColors.backgroundDarkLow,
          surfaceContainerHigh: Colors.red,
          tertiary: AppColors.blueL60,
        ),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          headlineMedium: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          headlineSmall: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          labelSmall: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 10.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w200,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          bodySmall: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          displaySmall: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
      ),
      home: const Dashboard(),
    );
  }
}
