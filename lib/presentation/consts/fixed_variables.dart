import 'package:flutter/material.dart';
import 'controllers.dart';
import 'strings.dart';
import '../pages/mainPages/myCourses/my_courses_page.dart';
import '../pages/mainPages/home/home_page.dart';
import '../pages/mainPages/profile/profile_screen.dart';

class FixedVariables {
  static final logInRequirments = {
    'Full Name': nameController,
    'E-mail': emailController,
    'Password': passwordController,
    'Phone number': phoneController,
    'Address': addressController,
  };

  /// <-- This is the list of the requirments for the log in.
  static final logInRequirmentsIcons = [
    userIcon,
    emailIcon,
    lockIcon,
    phoneIcon,
    mapPinIcon1
  ];

  /// <-- This is the list of the requirments Icons for the log in.

  static final List<String> navigationBarItems = [
    homeIcon,
    openBookIcon,
    activeCoursesIcon,
  ];

  /// <-- This is the list of the navigation bar items.

  static List<Widget> navigationCenterPages = [
    const HomePage(),
    const MyCoursesPage(),
    const ProfilePage(),
  ];

  ///<-- This is the list of the navigation center pages.

  static const Duration myDuration = Duration(milliseconds: 500);

  /// <-- This is the duration of the animation.
  static const loremText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ';

  /// <-- This is the text for filling .
}
