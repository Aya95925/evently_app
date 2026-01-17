import 'package:evently_app/ui/screen/Login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EventlyApp());
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
