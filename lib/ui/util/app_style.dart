import 'package:evently_app/ui/util/app_color.dart';
import 'package:flutter/material.dart';

abstract final class AppStyle {
  static const TextStyle blue24SemiBold = TextStyle(
    color: AppColor.primaryBlue,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle grey16Regular = TextStyle(
    color: AppColor.textSecondarygray,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle blue14SemiBold = TextStyle(
    color: AppColor.primaryBlue,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle white18Medium = TextStyle(
    color: AppColor.textPrimaryDarkWhite,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle white14Medium = TextStyle(
    color: AppColor.textPrimaryDarkWhite,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle white20Medium = TextStyle(
    color: AppColor.textPrimaryDarkWhite,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle blue18Medium = TextStyle(
    color: AppColor.primaryBlue,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle blue16Medium = TextStyle(
    color: AppColor.primaryBlue,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle grey12Regular = TextStyle(
    color: AppColor.textSecondarygray,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle white14semiBold = TextStyle(
    fontSize: 14,
    color: AppColor.textPrimaryDarkWhite,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle black14Regular = TextStyle(
    fontSize: 14,
    color: AppColor.backgroundDarkBlack,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle black20Medium = TextStyle(
    fontSize: 20,
    color: AppColor.textPrimaryblack,
    fontWeight: FontWeight.w500,
  );
}
