import 'package:flutter/material.dart';
import '../../consts/colors.dart';
import 'my_text.dart';
import 'package:sizer/sizer.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.color,
    this.margin,
    this.isFilled = true,
    required this.title,
    this.onTap,
    this.width,
    this.height,
  }) : super(key: key);
  final String title;
  final Color color;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final bool isFilled;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: width,
        height: height ?? 13.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isFilled ? color : Colors.white,
            border: Border.all(
                color: isFilled ? Colors.transparent : MyColors.orange,
                width: 2),
            borderRadius: BorderRadius.circular(2.w)),
        child: MyText(
          title,
          fontSize: 10.sp,
          color: isFilled ? Colors.white : MyColors.orange,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
