import 'package:evently_app/ui/screen/Login/login_screen.dart';
import 'package:evently_app/ui/widget/register.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute loginRoute() =>
      MaterialPageRoute(builder: (context) => LoginScreen());
  static MaterialPageRoute registerRoute() =>
      MaterialPageRoute(builder: (context) => Register());
}
