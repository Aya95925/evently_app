import 'package:evently_app/model/user_dm.dart';
import 'package:evently_app/provider/language_provider.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:evently_app/ui/util/app_assets.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:flutter/material.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset(AppAssets.image11logo),
                ),
              ),
              SizedBox(height: 12),
              Text(
                UserDm.currentUser!.name,
                style: AppStyle.black14Regular.copyWith(fontSize: 20),
              ),
              SizedBox(height: 5),
              Text(
                UserDm.currentUser!.email,
                style: AppStyle.black14Regular.copyWith(fontSize: 16),
              ),

              buildThemeContainer(),
              SizedBox(height: 16),
              buildLanguageContainer(),
              SizedBox(height: 16),
              buildLogOut(),
            ],
          ),
        ),
      ),
    );
  }

  late ThemeProvider themeProvider;

  late LanguageProvider languageProvider;

  Widget buildThemeContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.strokeWhite,
        borderRadius: BorderRadius.circular(24),
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.strokeWhite,
        borderRadius: BorderRadius.circular(24),
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

  Widget buildLogOut() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.strokeWhite,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Text('Log Out', style: AppStyle.black16Medium),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.logout, color: AppColor.errorRed),
            ),
          ],
        ),
      ),
    );
  }
}
