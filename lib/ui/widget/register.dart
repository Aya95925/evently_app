import 'package:evently_app/ui/util/app_assets.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/util/routes.dart';
import 'package:evently_app/ui/widget/custom_TextField.dart';
import 'package:evently_app/ui/widget/custom_container_evently.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
              Image.asset(AppAssets.eventlyImg),
              SizedBox(height: 28),
              Text('Create your account', style: AppStyle.blue24SemiBold),
              SizedBox(height: 24),
              CustomTextfield(
                hintText: 'Enter your name',
                prefixIcon: AppAssets.icUserSvg,
              ),
              SizedBox(height: 16),
              CustomTextfield(
                hintText: 'Enter your email',
                prefixIcon: AppAssets.icEmailSvg,
              ),
              SizedBox(height: 16),
              CustomTextfield(
                hintText: 'Enter your password',
                prefixIcon: AppAssets.icPasswordSvg,
                suffixIcon: AppAssets.eyeSlash,
              ),
              SizedBox(height: 8),
              CustomTextfield(
                hintText: 'Confirm your password',
                prefixIcon: AppAssets.icPasswordSvg,
                suffixIcon: AppAssets.eyeSlash,
              ),
              SizedBox(height: 8),

              SizedBox(height: 47),
              CustomContainerEvently(
                onPressed: () {},
                text: Text('Sign Up', style: AppStyle.white20Medium),
              ),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: AppStyle.grey16Regular,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, Routes.loginRoute());
                    },
                    child: Text(
                      ' login',
                      style: AppStyle.blue14SemiBold.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.primaryBlue,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Center(child: Text('Or', style: AppStyle.blue16Medium)),
              SizedBox(height: 24),
              CustomContainerEvently(
                onPressed: () {
                  Navigator.push(context, Routes.loginRoute());
                },

                text: Text(
                  'Sign Up With Google',
                  style: AppStyle.white18Medium,
                ),
                color: AppColor.textPrimaryDarkWhite,
                image: AppAssets.googleImg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
