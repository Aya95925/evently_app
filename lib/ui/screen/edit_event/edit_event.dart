import 'package:evently_app/firebase_utils/fireBase_utils.dart';
import 'package:evently_app/model/even_dm.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_constant.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/widget/build_date_row.dart';
import 'package:evently_app/ui/widget/build_time_row.dart';
import 'package:evently_app/ui/widget/custom_TextField.dart';
import 'package:evently_app/ui/widget/custom_event_icon_container.dart';
import 'package:evently_app/ui/widget/home_tabs.dart';
import 'package:flutter/material.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key, required this.eventDM});
  final EventDM eventDM;

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  late CategoryDM categoryDM;

  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    categoryDM = widget.eventDM.categoryDM;
    selectedDate = widget.eventDM.dateTime;
    selectedTime = TimeOfDay.fromDateTime(widget.eventDM.dateTime);
    titleController.text = widget.eventDM.title;
    descriptionController.text = widget.eventDM.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: CustomEventIconContainer(
          icon: Icon(Icons.arrow_back_ios, color: AppColor.primaryBlue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Edit event', style: AppStyle.black20Medium),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                categoryDM.imagePath,
                height: MediaQuery.of(context).size.height * .25,
                width: double.infinity,
              ),
              const SizedBox(height: 16),
              HomeTabs(
                categoryDM: AppConstants.customCategories,
                onChange: (selectedCategory) {
                  categoryDM = selectedCategory;
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              Text('Title', style: AppStyle.black16Medium),
              const SizedBox(height: 8),
              CustomTextfield(
                hintText: 'Event Title',
                controller: titleController,
              ),
              const SizedBox(height: 16),
              Text('Description', style: AppStyle.black16Medium),
              const SizedBox(height: 8),
              CustomTextfield(
                hintText: 'Event Description',
                minLines: 5,
                controller: descriptionController,
              ),
              const SizedBox(height: 16),

              BuildDateRow(
                selectedDate: selectedDate,
                onDateChanged: (date) {
                  selectedDate = date;
                  setState(() {});
                },
              ),

              const SizedBox(height: 20),

              BuildTimeRow(
                selectedTime: selectedTime,
                onTimeChanged: (time) {
                  selectedTime = time;
                  setState(() {});
                },
              ),

              const SizedBox(height: 40),

              updateEventToFireStore(
                EventDM(
                  categoryDM: categoryDM,
                  dateTime: selectedDate,
                  title: titleController.text,
                  description: descriptionController.text,
                  id: widget.eventDM.id,
                ),
                context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
