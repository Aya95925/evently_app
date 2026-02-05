import 'package:evently_app/ui/util/app_assets.dart';
import 'package:evently_app/ui/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      navigation();
    });
  }

  void navigation() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final bool hasIntroScreeen = pref.getBool('hasIntroScreen') ?? false;
    if (!mounted) return;
    if (hasIntroScreeen) {
      Navigator.pushReplacement(context, Routes.loginRoute);
    } else {
      Navigator.pushReplacement(context, Routes.introScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            AppAssets.eventlyImg,
            width: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
