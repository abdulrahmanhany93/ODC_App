import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../consts/colors.dart';
import '../../consts/controllers.dart';
import '../../consts/strings.dart';
import 'my_text.dart';
import 'package:sizer/sizer.dart';

class MyForm extends StatelessWidget {
  const MyForm({
    Key? key,
    required this.controller,
    required this.title,
    this.image = '',
    this.additionalText = '',
    this.hasIcon = true,
    this.color = MyColors.lightGrey,
    this.onTap,
    this.height,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final String? image;
  final bool hasIcon;
  final Color color;
  final double? height;
  final String additionalText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height ?? 14.w,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 2.h),
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.w),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: hasIcon ? Image.asset(image!, width: 5.5.w) : null,
                    contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                    hintText: title,
                    suffixIcon: controller == passwordController
                        ? GestureDetector(
                            onTap: () => controller.clear(),
                            child: Image.asset(eyeOffIcon))
                        : null,
                    suffixIconConstraints: BoxConstraints(maxWidth: 4.w),
                    hintStyle: GoogleFonts.roboto(
                        color: MyColors.grey1, fontSize: 10.sp)),
              ),
            ],
          ),
        ),
        additionalText.isNotEmpty
            ? GestureDetector(
                onTap: onTap,
                child: Align(
                  alignment: Alignment.topRight,
                  child: MyText(
                    additionalText,
                    fontSize: 9.5.sp,
                    color: MyColors.orange,
                    underLine: true,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
