import 'package:calend/data/providers/events.dart';
import 'package:calend/data/providers/step_radio.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

// This class manages the providers for the app
class AppProviders {
  // This method initializes the providers for the app
  static Widget initializeProviders({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RadioStep()),
        ChangeNotifierProvider(create: (_) => EventsProvider()),
      ],
      child: child,
    );
  }
}
