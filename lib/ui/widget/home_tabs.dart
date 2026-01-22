import 'package:evently_app/model/even_dm.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:flutter/material.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key, required this.categoryDM, required this.onChange});
  final List<CategoryDM> categoryDM;
  final Function(CategoryDM) onChange;

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categoryDM.length,

      child: TabBar(
        onTap: (value) {
          selectedIndex = value;
          widget.onChange(widget.categoryDM[value]);
          setState(() {});
        },
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: Colors.transparent,
        indicator: BoxDecoration(color: Colors.transparent),
        padding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        tabs: widget.categoryDM.map(mapWidgetToCatgory).toList(),
      ),
    );
  }

  Widget mapWidgetToCatgory(CategoryDM category) {
    bool isSelected = selectedIndex == widget.categoryDM.indexOf(category);
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.primaryBlue
            : AppColor.textPrimaryDarkWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              category.icon,
              color: isSelected
                  ? AppColor.textPrimaryDarkWhite
                  : AppColor.primaryBlue,
            ),
            SizedBox(width: 9),
            Text(
              category.name,
              style: isSelected
                  ? AppStyle.white14Medium.copyWith(fontSize: 18)
                  : AppStyle.blue18Medium,
            ),
          ],
        ),
      ),
    );
  }
}
