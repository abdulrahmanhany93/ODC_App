import 'package:flutter/material.dart';
import '../../consts/fixed_variables.dart';
import '../../widgets/main_widgets/indicator.dart';
import '../../consts/colors.dart';
import '../../consts/routes.dart';
import '../../widgets/main_widgets/my_button.dart';
import '../../widgets/main_widgets/my_text.dart';
import '../../widgets/main_widgets/my_button.dart';
import '../../widgets/main_widgets/my_text.dart';
import '../../consts/strings.dart';

import 'package:sizer/sizer.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

List<String> images = [onBoarding1, onBoarding2, onBoarding3];
int currentPage = 0;

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: PageView.builder(
                  itemCount: 3,
                  onPageChanged: (index) {
                    //TODO: implement STATE MANAGEMENT
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Image.asset(images[index], fit: BoxFit.fitWidth),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: MyText(
                    'Learn a lot of courses \n in Orange Education',
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 60.w,
                    child: MyText(FixedVariables.loremText,
                        color: Colors.grey, fontSize: 9.sp),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Indicator(currentIndex: currentPage, numberOf: 3)),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyButton(
                        title: 'Join Now',
                        width: 35.w,
                        color: MyColors.orange,
                        onTap: () => Navigator.pushNamed(context, signUpPage)),
                    MyButton(
                        title: 'Log In',
                        color: MyColors.orange,
                        width: 35.w,
                        onTap: () => Navigator.pushNamed(context, logInPage),
                        isFilled: false),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
