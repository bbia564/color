import 'package:color_extractor/app/modules/roottab/controllers/roottab_controller.dart';

import 'package:color_extractor/app/modules/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CECustomAppBarItem {
  final Color activeColor;
  final String title;
  final String iconName;
  CECustomAppBarItem(
      {required this.activeColor, required this.title, required this.iconName});
}

class CECustomAppBar extends StatefulWidget {
  final List<CECustomAppBarItem> barItems;
  final RoottabController tabController;
  const CECustomAppBar(
      {super.key,
      required this.barItems,
      required this.tabController});

  @override
  CECustomAppbarState createState() => CECustomAppbarState();
}

class CECustomAppbarState extends State<CECustomAppBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom,
      alignment: Alignment.topLeft,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildBarItems(),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> barItems = [];
    for (int i = 0; i < widget.barItems.length; i++) {
      CECustomAppBarItem item = widget.barItems[i];
      bool isSelected = widget.tabController.currentPage.value == i;
      barItems.add(
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              widget.tabController.tabbarClick(i);
            },
            child: Container(
              alignment: Alignment.center,
              height: kBottomNavigationBarHeight,
              child: isSelected
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            color: item.activeColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        4.verticalSpace,
                        Image.asset(item.iconName, width: 18.w, height: 4.h)
                      ],
                    ) 
                  : Container(
                      alignment: Alignment.center,
                      child: Text(
                        item.title,
                        style: TextStyle(
                          color: grey_text_color,
                          fontSize: 14.sp,
                        ),
                      ),
                    ) ,
            ),
          ),
        ),
      );
    }

    return barItems;
  }
}
