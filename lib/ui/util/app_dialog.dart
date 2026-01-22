import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Row(
          children: [
            Text('Loading...'),
            Spacer(),
            CircularProgressIndicator(color: AppColor.primaryBlue),
          ],
        ),
      );
    },
  );
}

showMessage(
  BuildContext context, {
  required String message,
  String? title,
  String? posText,
  String? negText,
  Function? onPosText,
  Function? onNegaText,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: Text(message, style: AppStyle.black20Medium),
        actions: [
          if (negText != null)
            TextButton(
              onPressed: () {
                onPosText?.call();
                Navigator.pop(context);
              },
              child: Text(negText),
            ),
          if (posText != null)
            TextButton(
              onPressed: () {
                onNegaText?.call();
                Navigator.pop(context);
              },
              child: Text(posText),
            ),
        ],
      );
    },
  );
}
