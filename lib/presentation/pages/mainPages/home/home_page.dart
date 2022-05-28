import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/course_widgets/course_code_widget.dart';
import '../../../widgets/course_widgets/course_widget.dart';
import '../../../widgets/main_widgets/header_title.dart';
import '../../../../bussiness_logic/appData/appdata_cubit.dart';
import '../../../consts/colors.dart';
import '../../../consts/cubites.dart';
import '../../../consts/routes.dart';
import '../../../consts/strings.dart';
import '../../../widgets/category_widgets/category_widget.dart';

import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Image.asset(odcLogo2,
                    width: 35.w, alignment: Alignment.centerLeft),
              ),
              const CourseCodeWidget(),
              HeaderTitle(
                title: 'Top Categories',
                onTap: () => Navigator.pushNamed(context, allCategoriesPage,
                    arguments: appdataCubit.categories),
              ),
              BlocBuilder<AppdataCubit, AppdataState>(
                builder: (context, state) {
                  if (state is! FetchingData) {
                    return AspectRatio(
                        aspectRatio: 3.4,
                        child: ListView.builder(
                            itemCount: appdataCubit.categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => CategoryWidget(
                                  category: appdataCubit.categories[index],
                                )));
                  } else {
                    return Center(
                        child: LinearProgressIndicator(
                      color: MyColors.orange,
                      minHeight: 0.5.h,
                      backgroundColor: MyColors.lightGrey,
                    ));
                  }
                },
              ),
              HeaderTitle(
                title: 'New Courses',
                onTap: () => Navigator.pushNamed(context, coursesPage),
              ),
              BlocBuilder<AppdataCubit, AppdataState>(
                builder: (context, state) {
                  if (state is! FetchingData) {
                    return Expanded(
                      flex: 1,
                      child: ListView.builder(
                          itemCount: appdataCubit.courses.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CourseWidget(
                                courseModel: appdataCubit.courses[index],
                              )),
                    );
                  } else {
                    return Center(
                        child: LinearProgressIndicator(
                      color: MyColors.orange,
                      minHeight: 20.h,
                      backgroundColor: MyColors.lightGrey,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
