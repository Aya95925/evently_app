import 'package:evently_app/firebase_utils/fireBase_utils.dart';
import 'package:evently_app/model/even_dm.dart';
import 'package:evently_app/model/user_dm.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:flutter/material.dart';

class IconHeart extends StatefulWidget {
  const IconHeart({super.key, required this.events});
  final EventDM events;

  @override
  State<IconHeart> createState() => _IconHeartState();
}

class _IconHeartState extends State<IconHeart> {
  @override
  Widget build(BuildContext context) {
    final user = UserDm.currentUser;

    if (user == null) {
      return const Icon(Icons.favorite_border, color: AppColor.primaryBlue);
    }

    final isFav = user.isFavourite.contains(widget.events.id);

    return InkWell(
      onTap: () {
        if (isFav) {
          removeFavouriteEventFromFireStore(widget.events.id, user);
        } else {
          addFavouriteEventToFireStore(widget.events.id, user);
        }
        setState(() {});
      },
      child: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: AppColor.primaryBlue,
      ),
    );
  }
}
