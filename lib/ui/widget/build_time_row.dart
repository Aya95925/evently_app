import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:flutter/material.dart';

class BuildTimeRow extends StatelessWidget {
  final TimeOfDay selectedTime;
  final Function(TimeOfDay) onTimeChanged;

  const BuildTimeRow({
    super.key,
    required this.selectedTime,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, color: AppColor.primaryBlue),
        const SizedBox(width: 8),
        Text('Event Time', style: AppStyle.black16Medium),
        const SizedBox(width: 8),
        Text('${selectedTime.hour}:${selectedTime.minute}'),
        const Spacer(),
        InkWell(
          onTap: () async {
            TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime: selectedTime,
            );
            if (time != null) {
              onTimeChanged(time);
            }
          },
          child: Text(
            'choose Time',
            style: AppStyle.blue14SemiBold.copyWith(
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
