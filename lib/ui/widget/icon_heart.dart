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
    return InkWell(
      onTap: () {
        if (UserDm.currentUser!.isFavourite.contains(widget.events.id)) {
          removeFavouriteEventFromFireStore(
            widget.events.id,
            UserDm.currentUser!,
          );
        } else {
          addFavouriteEventToFireStore(widget.events.id, UserDm.currentUser!);
        }
        setState(() {});
      },
      child: Icon(
        UserDm.currentUser!.isFavourite.contains(widget.events.id)
            ? Icons.favorite
            : Icons.favorite_border,
        color: AppColor.primaryBlue,
      ),
    );
  }
}
