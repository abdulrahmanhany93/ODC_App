import 'package:flutter/material.dart';
import '../../../consts/colors.dart';
import '../../../consts/cubites.dart';
import '../../../widgets/course_widgets/my_courses_card.dart';
import '../../../widgets/main_widgets/my_text.dart';

import 'package:sizer/sizer.dart';

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.lightGrey,
        elevation: 0,
        leadingWidth: 2.w,
        title: MyText(
          'My Courses',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: MyColors.orange,
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          itemBuilder: (context, index) =>
              MyCourseCard(course: appdataCubit.courses[index]),
          itemCount: appdataCubit.courses.length),
    );
  }
}
