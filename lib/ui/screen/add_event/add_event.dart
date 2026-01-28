import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/even_dm.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_constant.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/util/routes.dart';
import 'package:evently_app/ui/widget/custom_TextField.dart';
import 'package:evently_app/ui/widget/custom_container_evently.dart';
import 'package:evently_app/ui/widget/home_tabs.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  CategoryDM categoryDM = AppConstants.customCategories[0];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, color: AppColor.primaryBlue),
        ),
        title: Text('Add event', style: AppStyle.black20Medium),
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
              SizedBox(height: 16),
              HomeTabs(
                categoryDM: AppConstants.customCategories,
                onChange: (selectedCategory) {
                  categoryDM = selectedCategory;
                  setState(() {});
                },
              ),
              SizedBox(height: 16),
              Text('Title', style: AppStyle.black16Medium),
              SizedBox(height: 8),
              CustomTextfield(
                hintText: 'Event Title',
                controller: titleController,
              ),
              SizedBox(height: 16),
              Text('Description', style: AppStyle.black16Medium),
              SizedBox(height: 8),
              CustomTextfield(
                hintText: 'Event Description',
                minLines: 5,
                controller: descriptionController,
              ),
              SizedBox(height: 16),
              buildDateRow(context),
              SizedBox(height: 20),
              buildTimeRow(context),
              SizedBox(height: 40),
              createEventToFireStore(
                EventDM(
                  categoryDM: categoryDM,
                  dateTime: selectedDate,
                  title: titleController.text,
                  description: descriptionController.text,
                  id: '',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomContainerEvently createEventToFireStore(EventDM eventDm) {
    return CustomContainerEvently(
      onPressed: () {
        CollectionReference collection = FirebaseFirestore.instance.collection(
          'events',
        );
        var emptyDoc = collection.doc();
        eventDm.id = emptyDoc.id;
        emptyDoc.set(eventDm.toJson());

        Navigator.push(context, Routes.homeScreen);
      },
      text: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Text('Add event', style: AppStyle.white20Medium),
      ),
    );
  }

  Row buildTimeRow(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, color: AppColor.primaryBlue),
        SizedBox(width: 8),
        Text(
          'Event Time',
          style: AppStyle.black16Medium,
          textDirection: TextDirection.rtl,
        ),
        Text('${selectedTime.hour}:${selectedTime.minute}'),
        Spacer(),
        InkWell(
          onTap: () async {
            selectedTime =
                await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ) ??
                selectedTime;
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

  Row buildDateRow(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_month, color: AppColor.primaryBlue),
        SizedBox(width: 8),
        Text('Event Date', style: AppStyle.black16Medium),
        Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
        Spacer(),
        InkWell(
          onTap: () async {
            selectedDate =
                await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 120)),
                ) ??
                selectedDate;
            setState(() {});
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
