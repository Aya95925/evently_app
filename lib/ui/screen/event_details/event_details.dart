import 'package:evently_app/model/even_dm.dart';

import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/util/routes.dart';
import 'package:evently_app/ui/widget/custom_event_icon_container.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key, required this.event});
  final EventDM event;
  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Event Details'),
        leading: CustomEventIconContainer(
          icon: Icon(Icons.arrow_back_ios, color: AppColor.primaryBlue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          CustomEventIconContainer(
            icon: Icon(Icons.edit, color: AppColor.primaryBlue),
            onPressed: () {
              Navigator.push(context, Routes.editEvent(widget.event));
            },
          ),
          CustomEventIconContainer(
            icon: Icon(Icons.delete, color: AppColor.errorRed),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.event.categoryDM.imagePath,
                  height: MediaQuery.of(context).size.height * .25,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(widget.event.title, style: AppStyle.black20Medium),
              SizedBox(height: 16),
              customContainerDateAndTime(),
              SizedBox(height: 16),
              Text('Description', style: AppStyle.black16Medium),
              SizedBox(height: 16),
              customContainerDoscription(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Container customContainerDoscription() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.textPrimaryDarkWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(widget.event.description, style: AppStyle.black14Regular),
    );
  }

  Container customContainerDateAndTime() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.textPrimaryDarkWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.strokeWhite,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.all(10),
            child: Icon(Icons.calendar_month, color: AppColor.primaryBlue),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.event.dateTime.day}/${widget.event.dateTime.month}/${widget.event.dateTime.year}',
                style: AppStyle.black16Medium,
              ),
              SizedBox(height: 8),
              Text(
                '${widget.event.dateTime.hour}:${widget.event.dateTime.minute}',
                style: AppStyle.grey16Regular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
