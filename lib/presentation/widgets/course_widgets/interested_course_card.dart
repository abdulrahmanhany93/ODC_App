import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/models/course_model.dart';
import '../../consts/colors.dart';
import '../main_widgets/my_text.dart';

import 'package:sizer/sizer.dart';

class InterestedCourseCard extends StatelessWidget {
  const InterestedCourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        color: MyColors.hardGrey,
        borderRadius: BorderRadius.circular(2.w),
      ),
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 14.w,
            width: 14.w,
            decoration: BoxDecoration(
                color: MyColors.grey1,
                borderRadius: BorderRadius.circular(1.w),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(course.image),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 2.w,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: MyText(
              'Learn UI/UX for Beginners',
              fontSize: 8.sp,
              height: 0.3.h,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
