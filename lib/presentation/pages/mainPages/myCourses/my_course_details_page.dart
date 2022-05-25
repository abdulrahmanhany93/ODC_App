import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc_app/data/models/course_Model.dart';

import '../../../consts/colors.dart';
import '../../../consts/cubites.dart';
import '../../../consts/methods.dart';
import '../../../consts/strings.dart';
import '../../../widgets/course_widgets/course_datails_image.dart';
import '../../../widgets/course_widgets/course_enroll_widget.dart';
import '../../../widgets/course_widgets/interested_course_card.dart';
import '../../../widgets/main_widgets/my_button.dart';
import '../../../widgets/main_widgets/my_text.dart';
import 'package:sizer/sizer.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({Key? key, required this.course}) : super(key: key);
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CourseDetailsImage(course: course),
            buildMyListTile('Learn UI/UX for beginners', 'Author: Ahmed Abaza',
                textAlign: TextAlign.center),
            MyButton(
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              color: MyColors.orange,
              title: 'Start Course',
              onTap: () {
                usercontrollerCubit.enrollCourse(course.id);
                showCupertinoDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) => CourseEnrollWidget(
                          courseId: course.id,
                        ));
              },
            ),
            buildMyListTile('About this Course',
                'Welcome to your UX Design for Beginners Course. In the following tutorials, you\'ll get a thorough introduction to UX design, from its definition, areas and origins through to the skills you need to build a professional portfolio and become a UX designer. ',
                textAlign: TextAlign.start,
                titleFontSize: 10.sp,
                subFontSize: 9.sp),
            SizedBox(
              height: 2.h,
            ),
            ...buildAdditonalDetails(),
            ListTile(
              title: MyText(
                'You may be interested in',
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8.h,
              child: ListView.builder(
                itemCount: appdataCubit.courses
                    .where((element) => element.id != course.id)
                    .length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final courses = appdataCubit.courses
                      .where((element) => element.id != course.id)
                      .toList();
                  return InterestedCourseCard(course: courses[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildAdditonalDetails() {
    return List.generate(
        2,
        (index) => ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
              tileColor: MyColors.lightGrey,
              leading: Image.asset(
                isFirstItem(index) ? levelIcon : mapPinIcon2,
                width: 5.w,
                height: 5.w,
              ),
              title: MyText(
                isFirstItem(index) ? 'Beginner Level' : 'Cairo',
                fontSize: 11.sp,
                color: Colors.black,
              ),
            ));
  }
}
