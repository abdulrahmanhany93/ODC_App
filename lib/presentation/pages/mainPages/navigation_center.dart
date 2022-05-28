import 'package:flutter/material.dart';
import '../../consts/cubites.dart';
import '../../consts/fixed_variables.dart';
import '../../widgets/navigation_center_bar.dart';

class NavigationCenter extends StatefulWidget {
  const NavigationCenter({Key? key}) : super(key: key);

  @override
  State<NavigationCenter> createState() => _NavigationCenterState();
}

class _NavigationCenterState extends State<NavigationCenter> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
          duration: FixedVariables.myDuration,
          child: FixedVariables.navigationCenterPages[currentIndex]),
      bottomNavigationBar: NaviagtionCenterBar(
          currentIndex: currentIndex,
          onTap: (index) {
            ///TODO STATE MANAGEMENT HERE
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }

  @override
  void initState() {
    usercontrollerCubit.fetchUserData();
    super.initState();
  }
}
