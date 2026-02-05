import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/even_dm.dart';
import 'package:evently_app/model/user_dm.dart';

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
