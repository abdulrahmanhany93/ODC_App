import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../consts/colors.dart';
import '../../consts/cubites.dart';
import '../../consts/routes.dart';
import '../main_widgets/my_button.dart';
import '../main_widgets/my_form.dart';
import '../main_widgets/my_text.dart';

import 'package:sizer/sizer.dart';

class CourseEnrollWidget extends StatefulWidget {
  const CourseEnrollWidget({
    Key? key,
    required this.courseId,
  }) : super(key: key);
  final int courseId;

  @override
  State<CourseEnrollWidget> createState() => _CourseEnrollWidgetState();
}

bool goToEnterCode = false;

class _CourseEnrollWidgetState extends State<CourseEnrollWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: usercontrollerCubit,
      child: Container(
        width: 70.w,
        margin: EdgeInsets.symmetric(
            vertical: goToEnterCode ? 30.h : 35.h, horizontal: 15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    size: 18.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: 50.w,
                height: 11.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.w),
                    border: Border.all(color: MyColors.lightGrey, width: 5)),
                child: MyText(
                  '* * * * * *',
                  fontSize: 30.sp,
                  color: MyColors.orange,
                ),
              ),
              buildGuidText(goToEnterCode
                  ? 'Enter the Code to Get your course'
                  : 'The Code has been Sent'),
              goToEnterCode
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 0),
                      child: MyForm(
                        height: 12.w,
                        controller: TextEditingController(),
                        color: MyColors.hardGrey,
                        title: 'xxxxxx',
                        hasIcon: false,
                      ),
                    )
                  : const SizedBox(),
              MyButton(
                margin: EdgeInsets.symmetric(horizontal: 7.w),
                height: 10.w,
                color: MyColors.orange,
                title: 'Next',
                onTap: () {
                  if (goToEnterCode == true) {
                    Navigator.pushNamed(context, courseExamPage);
                  } else {
                    setState(() {
                      goToEnterCode = !goToEnterCode;
                    });
                  }
                },
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    goToEnterCode = false;
    super.initState();
  }

  MyText buildGuidText(String title) {
    return MyText(
      title,
      textAlign: TextAlign.center,
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      color: MyColors.black,
    );
  }
}
