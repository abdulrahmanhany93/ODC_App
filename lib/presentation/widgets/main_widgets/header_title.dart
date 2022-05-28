import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'my_text.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 1.h),
      title: MyText(
        title,
        textAlign: TextAlign.start,
        fontSize: 15.sp,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: MyText(
          'See All',
          textAlign: TextAlign.start,
          fontSize: 9.sp,
          color: Colors.black,
          underLine: true,
        ),
      ),
    );
  }
}