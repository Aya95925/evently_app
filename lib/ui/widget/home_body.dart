import 'package:evently_app/model/user_dm.dart';
import 'package:evently_app/ui/util/app_assets.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_constant.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/widget/home_tabs.dart';

import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            buildHeader(),
            SizedBox(height: 24),
            HomeTabs(
              categoryDM: AppConstants.allCategories,
              onChange: (category) {},
            ),
            SizedBox(height: 24),
            buildListViewItem(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Welcome Back ✨', style: AppStyle.black14Regular),
            Spacer(),
            Image.asset(AppAssets.sun),
            SizedBox(width: 18),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.primaryBlue,
              ),
              child: Text('EN', style: AppStyle.white14semiBold),
            ),
          ],
        ),
        Text(UserDm.currentUser!.name, style: AppStyle.black20Medium),
      ],
    );
  }

  Widget buildListViewItem() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              margin: EdgeInsets.only(bottom: 24),
              height: MediaQuery.of(context).size.height * .24,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.sportLight),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.strokeWhite,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'data',
                        textAlign: TextAlign.center,
                        style: AppStyle.blue14SemiBold.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: AlignmentGeometry.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.strokeWhite,
                        ),
                        padding: EdgeInsets.all(10),

                        child: Row(
                          children: [
                            Text(
                              'This is a Birthday Party ',
                              style: AppStyle.black20Medium.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            Spacer(),
                            Image.asset(
                              AppAssets.heart,
                              color: Color(0xff0E3A99),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
