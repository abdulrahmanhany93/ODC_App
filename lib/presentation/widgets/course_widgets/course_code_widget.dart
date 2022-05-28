import 'package:flutter/material.dart';
import '../../consts/colors.dart';
import '../../consts/routes.dart';
import '../../widgets/main_widgets/my_text.dart';
import '../main_widgets/my_text.dart';
import '../main_widgets/my_form.dart';
import '../../consts/controllers.dart';

import 'package:sizer/sizer.dart';

class CourseCodeWidget extends StatelessWidget {
  const CourseCodeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 45.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          color: MyColors.black,
          borderRadius: BorderRadius.circular(2.w),
          boxShadow: [
            BoxShadow(
              color: MyColors.orange,
              offset: Offset(0, 1.w),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            'Enter the Code to\nGet your course',
            textAlign: TextAlign.start,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            height: 0.17.h,
          ),
          Row(
            children: [
              Expanded(
                child: MyForm(
                  controller: courseExamCodeController,
                  height: 12.w,
                  title: 'Enter code',
                  color: MyColors.lightBlack,
                  hasIcon: false,
                ),
              ),
              SizedBox(width: 3.w),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, courseExamPage),
                child: CircleAvatar(
                  maxRadius: 6.w,
                  backgroundColor: MyColors.orange,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
