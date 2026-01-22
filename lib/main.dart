import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/ui/screen/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const EventlyApp());
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
