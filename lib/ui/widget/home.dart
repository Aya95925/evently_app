import 'package:evently_app/ui/util/app_assets.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final List<Widget> tabs = [
    Container(child: Text('data')),
    Container(child: Text('Aya Ahmed')),
    Container(child: Text('aszdcgbhjnmkl')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: tabs[currentIndex],

      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: AppColor.textPrimaryDarkWhite),
        child: buildBottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      unselectedItemColor: AppColor.textSecondarygray,
      currentIndex: currentIndex,
      selectedItemColor: AppColor.primaryDarkBlue,

      onTap: (index) {
        currentIndex = index;
        setState(() {});
      },

      items: [
        buildBottomNavigationBarItem(image: AppAssets.home2, label: 'Home'),
        buildBottomNavigationBarItem(image: AppAssets.heart, label: 'Favorite'),
        buildBottomNavigationBarItem(image: AppAssets.user, label: 'User'),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String image,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(image)),
      label: label,
    );
  }
}
