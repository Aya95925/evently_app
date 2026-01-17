import 'package:evently_app/ui/util/app_color.dart';
import 'package:flutter/material.dart';

class CustomContainerEvently extends StatelessWidget {
  const CustomContainerEvently({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = AppColor.primaryBlue,
    this.image,
  });
  final VoidCallback onPressed;
  final Widget text;
  final Color color;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: onPressed,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: image == null
            ? Center(child: text)
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...[Image.asset(image!), SizedBox(width: 16)],
                    text,
                  ],
                ),
              ),
      ),
    );
  }
}
