import 'package:flutter/widgets.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLocal = 'en';
  void updateLocal(String newLocal) {
    currentLocal = newLocal;
    notifyListeners();
  }
}
