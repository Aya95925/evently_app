import 'package:evently_app/ui/util/app_color.dart';
import 'package:flutter/material.dart';

class CustomEventIconContainer extends StatelessWidget {
  const CustomEventIconContainer({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final Widget icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, bottom: 15, right: 12),

      decoration: BoxDecoration(
        color: AppColor.textPrimaryDarkWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: IconButton(onPressed: onPressed, icon: icon),
      ),
    );
  }
}
