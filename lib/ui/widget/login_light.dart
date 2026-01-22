import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/ui/util/app_assets.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_dialog.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/util/routes.dart';
import 'package:evently_app/ui/widget/custom_TextField.dart';
import 'package:evently_app/ui/widget/custom_container_evently.dart';
import 'package:flutter/material.dart';

class LoginLight extends StatefulWidget {
  const LoginLight({super.key});

  @override
  State<LoginLight> createState() => _LoginLightState();
}

class _LoginLightState extends State<LoginLight> {
  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
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
              Text(
                appLocalizations.loginToYourAccount,
                style: AppStyle.blue24SemiBold,
              ),
              SizedBox(height: 24),
              CustomTextfield(
                hintText: appLocalizations.enterYourEmail,
                prefixIcon: AppAssets.icEmailSvg,
              ),
              SizedBox(height: 16),
              CustomTextfield(
                hintText: appLocalizations.enterYourPassword,
                prefixIcon: AppAssets.icPasswordSvg,
                suffixIcon: AppAssets.eyeSlash,
              ),
              SizedBox(height: 8),

              Text(
                appLocalizations.forgetPassword,
                textAlign: TextAlign.end,
                style: AppStyle.blue16Medium.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColor.primaryBlue,
                  decorationThickness: 1.5,
                ),
              ),
              SizedBox(height: 47),
              buildLoginBottom(),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appLocalizations.dontHaveAnAccount,
                    style: AppStyle.grey16Regular,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, Routes.registerRoute);
                    },
                    child: Text(
                      appLocalizations.signup,
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
                onPressed: () {},

                text: Text(
                  appLocalizations.loginWithGoogle,
                  style: AppStyle.blue18Medium,
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

  CustomContainerEvently buildLoginBottom() {
    return CustomContainerEvently(
      onPressed: () async {
        showLoading(context);
        await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context);
        showMessage(
          context,
          message: AppLocalizations.of(context)!.youWantIt,
          onPosText: () {},
          onNegaText: () {},
          posText: AppLocalizations.of(context)!.ok,
          negText: AppLocalizations.of(context)!.cancel,
        );
      },
      text: Text(
        AppLocalizations.of(context)!.login,
        style: AppStyle.white20Medium,
      ),
    );
  }
}
