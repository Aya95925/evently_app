import 'package:evently_app/model/on_boarding_dm.dart';
import 'package:evently_app/ui/util/app_assets.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/util/routes.dart';
import 'package:evently_app/ui/widget/custom_container_evently.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomOnBoarding extends StatelessWidget {
  const CustomOnBoarding({
    super.key,
    required this.onBoardingDm,
    required this.controller,
    required this.currentIndex,
    required this.totalPage,
    required this.onPressed,
  });

  final OnBoardingDm onBoardingDm;
  final PageController controller;
  final int currentIndex;
  final int totalPage;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex == 0
                      ? const SizedBox(width: 24)
                      : InkWell(
                          onTap: () {
                            controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColor.primaryBlue,
                          ),
                        ),

                  Image.asset(AppAssets.eventlyImg),

                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, Routes.loginRoute);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: Text('Skip', style: AppStyle.blue14SemiBold),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Image.asset(onBoardingDm.imagePath),

              const SizedBox(height: 16),

              Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: totalPage,
                  effect: const WormEffect(
                    dotHeight: 9,
                    dotWidth: 9,
                    strokeWidth: 1.5,
                    type: WormType.thinUnderground,
                    activeDotColor: AppColor.primaryBlue,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                onBoardingDm.title,
                style: AppStyle.black20Medium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: Text(
                  onBoardingDm.description,
                  style: AppStyle.grey16Regular,
                ),
              ),
              const Spacer(),
              CustomContainerEvently(
                onPressed: onPressed,
                text: Text('Next', style: AppStyle.white20Medium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
