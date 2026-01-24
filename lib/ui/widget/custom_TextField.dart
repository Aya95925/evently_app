import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.minLines = 1,
    this.maxLines = 10,
    this.controller,
  });
  final String hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final int minLines;
  final int maxLines;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    final InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColor.strokeWhite, width: 1),
    );
    return TextFormField(
      controller: controller,
      minLines: minLines,

      maxLines: maxLines + 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.textPrimaryDarkWhite,
        border: border,
        errorBorder: border,
        focusedBorder: border,
        enabledBorder: border,
        hintText: hintText,
        hintStyle: AppStyle.grey16Regular,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),

        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: prefixIcon != null ? SvgPicture.asset(prefixIcon!) : null,
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
