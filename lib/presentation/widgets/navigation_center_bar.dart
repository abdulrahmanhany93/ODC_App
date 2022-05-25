import 'package:flutter/material.dart';
import '../consts/colors.dart';
import '../consts/fixed_variables.dart';
import '../consts/methods.dart';
import 'package:sizer/sizer.dart';

class NaviagtionCenterBar extends StatelessWidget {
  const NaviagtionCenterBar({Key? key, required this.currentIndex, this.onTap})
      : super(key: key);
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      onTap: onTap,
      items: List.generate(
        FixedVariables.navigationBarItems.length,
        (index) => BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  FixedVariables.navigationBarItems[index],
                  width: 6.w,
                  color: isTapped(currentIndex, index)
                      ? MyColors.orange
                      : MyColors.lightBlack,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 0.5.h),
                AnimatedContainer(
                  width: isTapped(currentIndex, index) ? 1.w : 0,
                  height: isTapped(currentIndex, index) ? 1.w : 0,
                  duration: FixedVariables.myDuration,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: MyColors.orange),
                )
              ],
            ),
            label: ''),
      ),
    );
  }
}
