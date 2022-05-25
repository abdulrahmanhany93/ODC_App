import 'package:flutter/material.dart';
import 'package:odc_app/presentation/consts/colors.dart';
import 'package:odc_app/presentation/consts/strings.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_text.dart';
import 'package:sizer/sizer.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
          color: MyColors.hardWhite,
          boxShadow: [
            BoxShadow(
                color: MyColors.grey1, blurRadius: 5, offset: Offset(0, 0.5.w))
          ],
          borderRadius: BorderRadius.circular(3.w)),
      child: Row(
        children: [
          Image.asset(
            starIcon,
            width: 20.w,
          ),
          Expanded(
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.w)),
              title: MyText(
                'Learn UI/UX for Beginners',
                fontSize: 9.5.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              subtitle: MyText(
                'Achieved April 21 2022',
                color: MyColors.grey1,
                fontWeight: FontWeight.w600,
                fontSize: 9.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
