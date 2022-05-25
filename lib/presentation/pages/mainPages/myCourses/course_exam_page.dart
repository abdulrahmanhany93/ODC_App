import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_button.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_text.dart';
import '../../../../bussiness_logic/userController/usercontroller_cubit.dart';
import '../../../../data/models/args_model.dart';
import '../../../consts/colors.dart';
import '../../../consts/controllers.dart';
import '../../../consts/cubites.dart';
import '../../../consts/methods.dart';
import '../../../consts/routes.dart';
import '../../../consts/strings.dart';

import 'package:sizer/sizer.dart';

class CourseExamPage extends StatelessWidget {
  const CourseExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsercontrollerCubit, UsercontrollerState>(
      listener: (context, state) {
        if (state is Error) {
          showErrorMsg(state.msg);
        }
        if (state is ExamQuestionsFetched) {
          Navigator.pushNamed(context, courseQuestionPage,
              arguments: ArgsModel(data1: state.questions[0], data2: 0));
        }
      },
      child: Scaffold(
        appBar: basicAppBar(context, 'Course Exam'),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                process,
                width: 100.w,
                height: 14.w,
              ),
              MyText(
                'Learn UI/UX for Beginners',
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              Image.asset(
                examIllustration,
              ),
              MyText(
                'Start your exam',
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              MyText(
                'Make Sure to Achieve More Than 60%',
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      'Exam Time',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    MyText(
                      '1 Hr',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              MyButton(
                color: MyColors.orange,
                title: 'Start',
                margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
                onTap: () => usercontrollerCubit
                    .fetchCourseExam(courseExamCodeController.text),
              )
            ],
          ),
        ),
      ),
    );
  }
}
