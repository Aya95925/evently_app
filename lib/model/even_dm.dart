import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EventDM {
  String id;
  final CategoryDM categoryDM;
  final String title;
  final String description;
  final DateTime dateTime;
  // bool isFavorite;

  EventDM({
    required this.categoryDM,
    required this.dateTime,
    required this.title,
    required this.description,
    required this.id,
    // required this.isFavorite,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': categoryDM.toJson(),
      'dateTime': dateTime,
    };
  }

  static EventDM fromJson(Map<String, dynamic> json) {
    return EventDM(
      categoryDM: CategoryDM.fromJson(json['category']),
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      title: json['title'],
      description: json['description'],
      id: json['id'],
    );
  }
}

class CategoryDM {
  String name;
  String imagePath;
  IconData icon;
  CategoryDM({required this.name, required this.imagePath, required this.icon});
  Map<String, dynamic> toJson() {
    return {'name': name, 'imagepath': imagePath, 'icon': icon.codePoint};
  }

  static CategoryDM fromJson(Map<String, dynamic> json) {
    return CategoryDM(
      name: json['name'],
      imagePath: json['imagepath'],
      icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
    );
  }
}
