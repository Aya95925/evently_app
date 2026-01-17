import 'package:evently_app/ui/util/app_assets.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/widget/custom_TextField.dart';
import 'package:evently_app/ui/widget/custom_container_evently.dart';
import 'package:flutter/material.dart';

class LoginLight extends StatelessWidget {
  const LoginLight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.eventlyImgPng),
              SizedBox(height: 28),
              Text('Login to your account', style: AppStyle.blue24SemiBold),
              SizedBox(height: 24),
              CustomTextfield(
                hintText: 'Enter your email',
                prefixIcon: AppAssets.icEmail,
              ),
              SizedBox(height: 16),
              CustomTextfield(
                hintText: 'Enter your password',
                prefixIcon: AppAssets.icPassword,
                suffixIcon: AppAssets.eyeSlash,
              ),
              SizedBox(height: 8),

              Text(
                'Forget Password',
                textAlign: TextAlign.end,
                style: AppStyle.blue16Medium.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColor.primaryBlue,
                  decorationThickness: 1.5,
                ),
              ),
              SizedBox(height: 47),
              CustomContainerEvently(
                onPressed: () {},
                text: Text('Login', style: AppStyle.white20Medium),
              ),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: AppStyle.grey16Regular,
                  ),
                  Text(
                    ' Signup',
                    style: AppStyle.blue14SemiBold.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColor.primaryBlue,
                      decorationThickness: 1.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Center(child: Text('Or', style: AppStyle.blue16Medium)),
              CustomContainerEvently(
                onPressed: () {},

                text: Text('Login with Google', style: AppStyle.white18Medium),
                color: AppColor.textPrimaryDarkWhite,
                image: AppAssets.googleImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
