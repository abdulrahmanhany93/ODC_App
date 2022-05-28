import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../consts/colors.dart';
import '../../consts/fixed_variables.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.currentIndex,
    required this.numberOf,
  }) : super(key: key);

  final int currentIndex;
  final int numberOf;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          numberOf,
          (index) => AnimatedContainer(
                duration: FixedVariables.myDuration,
                margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
                height: 2.5.w,
                width: 2.5.w,
                decoration: BoxDecoration(
                    color:
                        currentIndex == index ? MyColors.orange : Colors.grey,
                    borderRadius: BorderRadius.circular(50)),
              )),
    );
  }
}
