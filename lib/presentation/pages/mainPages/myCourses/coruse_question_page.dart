import 'package:flutter/material.dart';
import '../../../widgets/main_widgets/answer_card.dart';
import '../../../widgets/main_widgets/my_button.dart';
import '../../../widgets/main_widgets/my_text.dart';
import '../../../widgets/main_widgets/timer_widget.dart';
import '../../../../data/models/args_model.dart';
import '../../../../data/models/exam_model.dart';
import '../../../consts/colors.dart';
import '../../../consts/cubites.dart';
import '../../../consts/methods.dart';
import '../../../consts/routes.dart';

import 'package:sizer/sizer.dart';

class CourseQuestionPage extends StatefulWidget {
  const CourseQuestionPage({Key? key, required this.args}) : super(key: key);
  final ArgsModel args;
  @override
  State<CourseQuestionPage> createState() => _CourseQuestionPageState();
}

String currnetAnswer = '';

class _CourseQuestionPageState extends State<CourseQuestionPage> {
  @override
  Widget build(BuildContext context) {
    final Question question = widget.args.data1;
    return Scaffold(
      appBar: basicAppBar(context, 'Course Exam', hasBackButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: ListTile(
                  leading: MyText(
                    'Question',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  title: Text.rich(TextSpan(
                    text: '${widget.args.data2 + 1}',
                    children: [
                      TextSpan(
                        text: ' / 10',
                        children: const [],
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: MyColors.grey2,
                        ),
                      )
                    ],
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.orange,
                    ),
                  )),
                ),
              ),
              const TimerWidget(duration: 3600),
            ]),
            ListTile(
              minVerticalPadding: 5.h,
              title: MyText(
                question.question,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 32.h,
              child: ListView.builder(
                itemCount: question.answers.length,
                itemBuilder: (context, index) => AnswerCard(
                    answer: question.answers[index],
                    onTap: (value) {
                      setState(() {
                        currnetAnswer = value.toString();
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: isNotFirstQuestion
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.end,
              children: [
                if (isNotFirstQuestion)
                  Align(
                    alignment: Alignment.topRight,
                    child: MyButton(
                        width: 40.w,
                        height: 10.w,
                        isFilled: false,
                        color: currnetAnswer.isNotEmpty
                            ? MyColors.orange
                            : MyColors.grey1,
                        onTap: () => Navigator.pop(context),
                        title: 'Back'),
                  ),
                Align(
                  alignment: Alignment.topRight,
                  child: MyButton(
                    width: 40.w,
                    height: 10.w,
                    color: currnetAnswer.isNotEmpty
                        ? MyColors.orange
                        : MyColors.grey1,
                    title: 'Next',
                    onTap: () {
                      if (widget.args.data2 < 9) {
                        usercontrollerCubit.answers.add(currnetAnswer);
                        Navigator.pushNamed(context, courseQuestionPage,
                            arguments: ArgsModel(
                                data1: usercontrollerCubit
                                    .questions[widget.args.data2 + 1],
                                data2: widget.args.data2 + 1));
                      } else {
                        usercontrollerCubit.submitExam(int.parse('3558'));
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  get isNotFirstQuestion => widget.args.data2 > 0;

  @override
  void initState() {
    currnetAnswer = '';
    super.initState();
  }
}
