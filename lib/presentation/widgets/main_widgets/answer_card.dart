import 'package:flutter/material.dart';
import '../../consts/colors.dart';
import '../../pages/mainPages/myCourses/coruse_question_page.dart';
import 'my_text.dart';
import 'package:sizer/sizer.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({Key? key, required this.answer, this.onTap})
      : super(key: key);
  final String answer;
  final void Function(String?)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: MyColors.orange),
          borderRadius: BorderRadius.circular(2.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70.w,
            child: MyText(
              answer,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Transform.scale(
            scale: 1.5,
            child: Radio(
              value: answer,
              groupValue: currnetAnswer,
              fillColor: MaterialStateProperty.all(MyColors.orange),
              onChanged: onTap,
              activeColor: MyColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
