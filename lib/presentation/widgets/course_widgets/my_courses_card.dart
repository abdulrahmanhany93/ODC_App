import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:odc_app/data/models/courses_model.dart';
import '../../consts/colors.dart';
import '../../consts/routes.dart';
import '../main_widgets/my_text.dart';
import 'package:sizer/sizer.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);
  final CoursesModel course;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        courseDetailsPage,
        arguments: course,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        margin: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
            color: MyColors.hardWhite,
            boxShadow: [
              BoxShadow(
                  color: MyColors.grey1,
                  blurRadius: 5,
                  offset: Offset(0, 0.5.w))
            ],
            borderRadius: BorderRadius.circular(3.w)),
        child: Row(
          children: [
            CachedNetworkImage(
                imageUrl: course.image,
                imageBuilder: (context, imageProvider) => Container(
                      height: 19.w,
                      width: 23.w,
                      decoration: BoxDecoration(
                          color: MyColors.grey1,
                          borderRadius: BorderRadius.circular(2.5.w),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          )),
                    )),
            Expanded(
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.w)),
                title: MyText(
                  'Learn UI/UX for Beginners',
                  fontSize: 9.5.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                subtitle: MyText(
                  'Author : Ahmed Abaza',
                  color: MyColors.grey1,
                  fontWeight: FontWeight.w600,
                  fontSize: 9.sp,
                ),
                trailing: Container(
                  height: 6.w,
                  width: 6.w,
                  decoration: BoxDecoration(
                    color: MyColors.hardGrey,
                    borderRadius: BorderRadius.circular(1.w),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 10.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
