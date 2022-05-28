import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:odc_app/data/models/courses_model.dart';
import '../main_widgets/my_text.dart';
import '../../consts/colors.dart';

import 'package:sizer/sizer.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    Key? key,
    required this.courseModel,
  }) : super(key: key);
  final CoursesModel courseModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
            imageUrl: courseModel.image,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: MyColors.orange)),
            imageBuilder: (context, imageProvider) => Container(
                  height: 32.w,
                  width: 55.w,
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: MyColors.grey1,
                      borderRadius: BorderRadius.circular(4.5.w),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: MyText(
            courseModel.category.name,
            fontSize: 8.sp,
            color: MyColors.orange,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: MyText(
            courseModel.name,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: MyColors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: MyText(
            'Ahmed Abaza . 15 hours',
            fontSize: 8.sp,
            fontWeight: FontWeight.w900,
            color: MyColors.grey1,
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
      ],
    );
  }
}
