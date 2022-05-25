

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:odc_app/presentation/consts/colors.dart';
import 'package:odc_app/presentation/consts/cubites.dart';
import 'package:odc_app/presentation/consts/methods.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_text.dart';
import 'package:sizer/sizer.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: basicAppBar(context, 'New Courses'),
        body: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            itemBuilder: (context, index) => Row(
                  children: [
                    CachedNetworkImage(
                        imageUrl: appdataCubit.courses[index].image,
                        imageBuilder: (context, imageProvider) => Container(
                              height: 14.w,
                              width: 14.w,
                              decoration: BoxDecoration(
                                  color: MyColors.grey1,
                                  borderRadius: BorderRadius.circular(1.w),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  )),
                            )),
                    Expanded(
                      child: ListTile(
                        title: MyText(
                          'Learn UI/UX for Beginners',
                          fontSize: 9.5.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        subtitle: MyText(
                          'Sayed Ali . 15 Hours',
                          color: MyColors.grey1,
                          fontWeight: FontWeight.bold,
                          fontSize: 8.sp,
                        ),
                      ),
                    )
                  ],
                ),
            separatorBuilder: (context, index) =>
                const Divider(color: MyColors.grey2),
            itemCount: appdataCubit.courses.length));
  }
}
