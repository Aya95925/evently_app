import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/even_dm.dart';
import 'package:evently_app/model/user_dm.dart';
import 'package:evently_app/ui/util/app_assets.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_constant.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/widget/event_widget.dart';
import 'package:evently_app/ui/widget/home_tabs.dart';

import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<EventDM> events = [];
  var selectedCategory = AppConstants.allCategories[0];
  List<EventDM> filterEvent = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            buildHeader(),
            SizedBox(height: 24),
            FutureBuilder(
              future: getEventFromFireStore(),
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  return Center(
                    child: Text('Something went wrong ${snapShot.error}'),
                  );
                } else if (snapShot.hasData) {
                  events = snapShot.data!;
                  filterEvent = events;
                  filterEvents();
                  return Expanded(
                    child: Column(
                      children: [
                        buildHomeTap(),
                        SizedBox(height: 24),
                        buildListViewItem(),
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  HomeTabs buildHomeTap() {
    return HomeTabs(
      categoryDM: AppConstants.allCategories,
      onChange: (category) {
        selectedCategory = category;
        setState(() {});
      },
    );
  }

  void filterEvents() {
    if (selectedCategory != AppConstants.all) {
      filterEvent = events.where((event) {
        return event.categoryDM.name == selectedCategory.name;
      }).toList();
    } else {
      filterEvent = events;
    }
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Welcome Back ✨', style: AppStyle.black14Regular),
            Spacer(),
            Image.asset(AppAssets.sun),
            SizedBox(width: 18),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.primaryBlue,
              ),
              child: Text('EN', style: AppStyle.white14semiBold),
            ),
          ],
        ),
        Text(UserDm.currentUser!.name, style: AppStyle.black20Medium),
      ],
    );
  }

  Widget buildListViewItem() {
    return Expanded(
      child: ListView.builder(
        itemCount: filterEvent.length,
        itemBuilder: (context, index) {
          return EventWidget(events: filterEvent[index]);
        },
      ),
    );
  }

  Future<List<EventDM>> getEventFromFireStore() async {
    var eventCollection = FirebaseFirestore.instance.collection('events');
    QuerySnapshot snapShot = await eventCollection.get();
    List<EventDM> events = snapShot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return EventDM.fromJson(data);
    }).toList();
    return events;
  }
}

//   loadEventsFromFireStore() async {
//     events = await getEventFromFireStore();
//     filterEvent = events;
//     setState(() {});
//   }
// }
