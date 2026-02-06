import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/even_dm.dart';
import 'package:evently_app/model/user_dm.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/util/routes.dart';
import 'package:evently_app/ui/widget/custom_container_evently.dart';
import 'package:flutter/material.dart';

void addFavouriteEventToFireStore(String eventId, UserDm user) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentReference docRef = users.doc(user.id);
  List<String> favourites = List.of(user.isFavourite);
  favourites.add(eventId);
  user.isFavourite = favourites;
  docRef.update({'isFavourite': user.isFavourite});
}

void removeFavouriteEventFromFireStore(String eventId, UserDm user) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentReference docRef = users.doc(user.id);
  List<String> favourites = List.of(user.isFavourite);
  favourites.remove(eventId);
  user.isFavourite = favourites;
  docRef.update({'isFavourite': user.isFavourite});
}

Future<UserDm> getUserFromFireStore(String uId) async {
  var userCollection = FirebaseFirestore.instance.collection('users');
  DocumentSnapshot snapShot = await userCollection.doc(uId).get();
  Map<String, dynamic> json = snapShot.data() as Map<String, dynamic>;
  UserDm.currentUser = UserDm.fromJson(json);
  return UserDm.currentUser!;
}

Future<void> createUserInFireStore(UserDm userDm) async {
  var userCollection = FirebaseFirestore.instance.collection('users');
  var emptyDoc = userCollection.doc(userDm.id);
  await emptyDoc.set(userDm.toJson());
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

CustomContainerEvently createEventToFireStore(
  EventDM eventDm,
  BuildContext context,
) {
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

CustomContainerEvently updateEventToFireStore(
  EventDM eventDm,
  BuildContext context,
) {
  return CustomContainerEvently(
    onPressed: () async {
      try {
        CollectionReference collection = FirebaseFirestore.instance.collection(
          'events',
        );
        await collection.doc(eventDm.id).update(eventDm.toJson());
        Navigator.push(context, Routes.homeScreen);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("There was an error"),
            backgroundColor: AppColor.textPrimaryblack,
          ),
        );
      }
    },
    text: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Text('Update event', style: AppStyle.white20Medium),
    ),
  );
}
