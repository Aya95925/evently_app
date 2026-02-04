import 'package:cloud_firestore/cloud_firestore.dart';
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
