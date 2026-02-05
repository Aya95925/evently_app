import 'package:evently_app/model/on_boarding_dm.dart';
import 'package:evently_app/ui/util/app_assets.dart';
import 'package:evently_app/ui/util/routes.dart';
import 'package:evently_app/ui/widget/custom_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<OnBoardingDm> onBordingDms = [
    OnBoardingDm(
      title: 'Find Events That Inspire You',
      description:
          'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
      imagePath: AppAssets.hotTrending,
    ),
    OnBoardingDm(
      title: 'Effortless Event Planning',
      description:
          'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
      imagePath: AppAssets.manegerDesk,
    ),
    OnBoardingDm(
      title: 'Connect with Friends & Share Moments',
      description:
          'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
      imagePath: AppAssets.socialMedia,
    ),
  ];
  void completeIntroScreen() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('hasIntroScreen', true);

    if (!mounted) return;

    Navigator.pushReplacement(context, Routes.loginRoute);
  }

  void onPressed() {
    if (currentIndex < onBordingDms.length - 1) {
      pageController.nextPage(
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    } else {
      completeIntroScreen();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: onBordingDms.length,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemBuilder: (context, index) {
        return CustomOnBoarding(
          onBoardingDm: onBordingDms[index],
          controller: pageController,
          currentIndex: currentIndex,
          totalPage: onBordingDms.length,
          onPressed: onPressed,
        );
      },
    );
  }
}
