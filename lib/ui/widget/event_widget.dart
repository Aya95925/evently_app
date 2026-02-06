import 'package:evently_app/model/even_dm.dart';

import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/util/routes.dart';
import 'package:evently_app/ui/widget/icon_heart.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key, required this.events});

  final EventDM events;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, Routes.eventDetaild(events));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          margin: EdgeInsets.only(bottom: 24),
          height: MediaQuery.of(context).size.height * .24,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(events.categoryDM.imagePath),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.strokeWhite,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    events.title,
                    textAlign: TextAlign.center,
                    style: AppStyle.blue14SemiBold.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.strokeWhite,
                    ),
                    padding: EdgeInsets.all(10),

                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            events.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.black20Medium.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Spacer(),
                        IconHeart(events: events),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
