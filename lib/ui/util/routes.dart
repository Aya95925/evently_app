import 'package:evently_app/model/even_dm.dart';
import 'package:evently_app/ui/screen/Login/login_screen.dart';
import 'package:evently_app/ui/screen/add_event/add_event.dart';
import 'package:evently_app/ui/screen/edit_event/edit_event.dart';
import 'package:evently_app/ui/screen/event_details/event_details.dart';
import 'package:evently_app/ui/screen/onboarding/onboarding_screen.dart';
import 'package:evently_app/ui/widget/home.dart';
import 'package:evently_app/ui/widget/register.dart';
import 'package:flutter/material.dart';

abstract final class Routes {
  static MaterialPageRoute get loginRoute =>
      MaterialPageRoute(builder: (context) => LoginScreen());
  static MaterialPageRoute get registerRoute =>
      MaterialPageRoute(builder: (context) => Register());
  static MaterialPageRoute get addEvent =>
      MaterialPageRoute(builder: (context) => AddEvent());
  static MaterialPageRoute get homeScreen =>
      MaterialPageRoute(builder: (context) => Home());
  static MaterialPageRoute get introScreen =>
      MaterialPageRoute(builder: (context) => const OnboardingScreen());
  static MaterialPageRoute eventDetaild(EventDM event) =>
      MaterialPageRoute(builder: (context) => EventDetails(event: event));
  static MaterialPageRoute editEvent(EventDM event) =>
      MaterialPageRoute(builder: (context) => EditEvent(eventDM: event));
}
