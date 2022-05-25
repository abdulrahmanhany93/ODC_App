import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'colors.dart';
import '../widgets/main_widgets/my_text.dart';
import '../widgets/main_widgets/orange_corner.dart';

import 'package:sizer/sizer.dart';

bool isFirstItem(int index) => index == 0;

///< Returns true if index is 0
bool isTapped(int currentIndex, int index) => currentIndex == index;

///< Returns true if currentIndex is index

Positioned buildOrangeCorner({required bool isTop}) => Positioned(
      top: isTop ? -5.w : null,
      bottom: isTop ? null : -8.w,
      right: isTop ? -5.w : null,
      left: isTop ? null : -5.w,
      child: OrangeCorner(shadowTop: isTop),
    );

///< Returns the orange corner widget.
Row buildAccessTitle({required String title1, required String title2}) {
  return Row(
    children: List.generate(
        2,
        (index) => MyText(index == 0 ? title1 : title2,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: isFirstItem(index) ? Colors.black : MyColors.orange)),
  );

  ///< Returns the title of the access page.
}

AppBar basicAppBar(BuildContext context, String title,
    {bool hasBackButton = true}) {
  ///< Returns the basic app bar (Back button with only title).
  return AppBar(
    backgroundColor: MyColors.lightGrey,
    elevation: 0,
    leadingWidth: 20.w,
    leading: hasBackButton
        ? IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 18.sp,
              color: Colors.black,
            ),
          )
        : const SizedBox(),
    title: MyText(
      title,
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
}

showErrorMsg(String msg) {
  Fluttertoast.showToast(msg: msg, backgroundColor: MyColors.orange);
}

ListTile buildMyListTile(String title, String subtitle,
    {TextAlign? textAlign, double? titleFontSize, double? subFontSize}) {
  ///< Returns Customized listTile widget.
  return ListTile(
    title: MyText(
      title,
      fontSize: titleFontSize ?? 15.sp,
      fontWeight: FontWeight.w600,
      textAlign: textAlign,
      color: Colors.black,
    ),
    subtitle: MyText(
      subtitle,
      fontSize: subFontSize ?? 10.sp,
      fontWeight: FontWeight.w400,
      height: 0.2.h,
      textAlign: textAlign,
      color: MyColors.grey2,
    ),
  );
}
