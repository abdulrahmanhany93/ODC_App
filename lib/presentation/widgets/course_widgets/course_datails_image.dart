import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:odc_app/data/models/course_Model.dart';
import '../../consts/colors.dart';

import 'package:sizer/sizer.dart';

class CourseDetailsImage extends StatelessWidget {
  const CourseDetailsImage({
    Key? key,
    required this.course,
  }) : super(key: key);

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: course.image,
        imageBuilder: (context, imageProvider) => Container(
              height: 60.w,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
              decoration: BoxDecoration(
                  color: MyColors.grey1,
                  borderRadius: BorderRadius.circular(4.w),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  )),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(2.5.w),
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ));
  }
}
