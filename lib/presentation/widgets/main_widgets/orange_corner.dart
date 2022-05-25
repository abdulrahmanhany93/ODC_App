import 'package:flutter/material.dart';
import '../../consts/colors.dart';
import 'package:sizer/sizer.dart';

class OrangeCorner extends StatelessWidget {
  const OrangeCorner({
    Key? key,
    required this.shadowTop,
  }) : super(key: key);
  final bool shadowTop;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -50 / 360,
      child: Container(
        width: 35.w,
        height: 25.w,
        decoration: BoxDecoration(
            color: MyColors.orange,
            borderRadius: BorderRadius.circular(7.w),
            boxShadow: [
              BoxShadow(
                  color: MyColors.orange.withOpacity(0.2),
                  offset: Offset(0, shadowTop ? 15 : -15))
            ]),
      ),
    );
  }
}
