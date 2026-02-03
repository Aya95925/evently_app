import 'package:evently_app/provider/language_provider.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Provile extends StatefulWidget {
  const Provile({super.key});

  @override
  State<Provile> createState() => _ProvileState();
}

class _ProvileState extends State<Provile> {
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    languageProvider = Provider.of<LanguageProvider>(context);
    return Center(
      child: SafeArea(
        child: Column(
          children: [
            buildThemeContainer(),
            SizedBox(height: 16),
            buildLanguageContainer(),
          ],
        ),
      ),
    );
  }

  late ThemeProvider themeProvider;

  late LanguageProvider languageProvider;

  Widget buildThemeContainer() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.strokeWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text('Dark Mode', style: AppStyle.black16Medium),
          Spacer(),
          Switch(
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.updateTheme(
                value ? ThemeMode.dark : ThemeMode.light,
              );
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget buildLanguageContainer() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.strokeWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text('Language', style: AppStyle.black16Medium),
          Spacer(),
          Switch(
            value: languageProvider.currentLocal == 'ar',
            onChanged: (value) {
              languageProvider.updateLocal(value ? 'ar' : 'en');
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
