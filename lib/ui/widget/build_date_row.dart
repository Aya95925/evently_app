import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:flutter/material.dart';

class BuildDateRow extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  const BuildDateRow({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_month, color: AppColor.primaryBlue),
        const SizedBox(width: 8),
        Text('Event Date', style: AppStyle.black16Medium),
        const SizedBox(width: 8),
        Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
        const Spacer(),
        InkWell(
          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 120)),
            );
            if (date != null) {
              onDateChanged(date);
            }
          },
          child: Text(
            'choose date',
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
