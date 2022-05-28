import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../helpers/util/cach_manager.dart';
import '../../../consts/api_methods.dart';
import '../../../consts/cubites.dart';
import '../../../consts/routes.dart';
import '../../../widgets/main_widgets/acheivement_card.dart';
import '../../../consts/colors.dart';
import '../../../widgets/main_widgets/my_text.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    usercontrollerCubit.fetchUserData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.lightGrey,
        elevation: 0,
        leadingWidth: 2.w,
        title: MyText(
          'My Profile',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: MyColors.orange,
        ),
        actions: [
          IconButton(
              onPressed: () {
                final String token = CachManager.getString('token').toString();
                ApiHelper.logOut(token);
                Navigator.pushReplacementNamed(context, logInPage);
              },
              icon: const Icon(
                Icons.logout,
                color: MyColors.orange,
              ))
        ],
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              maxRadius: 20.w,
              backgroundImage: const CachedNetworkImageProvider(
                  'https://loveshayariimages.in/wp-content/uploads/2021/10/1080p-Latest-Whatsapp-Profile-Images-1.jpg'),
            ),
            MyText(
              usercontrollerCubit.user.name,
              color: Colors.black,
              fontSize: 15.sp,
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: MyColors.grey1,
                  borderRadius: BorderRadius.circular(10.w)),
              child: MyText(
                usercontrollerCubit.user.email,
                fontSize: 9.sp,
                color: MyColors.hardGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            MyText(
              'My Achievement',
              color: Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
            ),
            const AchievementCard(),
            const AchievementCard(),
            SizedBox(
              height: 12.h,
            )
          ],
        ),
      ),
    );
  }
}
