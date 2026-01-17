import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
  });
  final String hintText;
  final String prefixIcon;
  final String? suffixIcon;
  @override
  Widget build(BuildContext context) {
    final InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColor.strokeWhite, width: 1),
    );
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.textPrimaryDarkWhite,
        border: border,
        errorBorder: border,
        focusedBorder: border,
        enabledBorder: border,
        hintText: hintText,
        hintStyle: AppStyle.grey16Regular,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          // horizontal: 16,
        ),

        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SvgPicture.asset(prefixIcon),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 28,
          minHeight: 28,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: suffixIcon != null ? Image.asset(suffixIcon!) : null,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 28,
          minHeight: 28,
        ),
      ),
    );
  }
}
