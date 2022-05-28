import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/category_model.dart';
import '../../../consts/colors.dart';
import '../../../consts/cubites.dart';
import '../../../consts/methods.dart';
import '../../../consts/strings.dart';

import '../../../widgets/main_widgets/my_text.dart';


import 'package:sizer/sizer.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: basicAppBar(context, category.name),
        body: Column(
          children: [
            Container(
                width: 85.w,
                height: 11.w,
                margin: EdgeInsets.symmetric(vertical: 1.h),
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColors.hardGrey,
                    borderRadius: BorderRadius.circular(2.w)),
                child: Row(
                  children: [
                    Image.asset(
                      searchIcon,
                      width: 4.w,
                    ),
                    SizedBox(width: 4.w),
                    MyText('Search',
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                        color: MyColors.grey2)
                  ],
                )),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  itemBuilder: (context, index) => Row(
                        children: [
                          CachedNetworkImage(
                              imageUrl: appdataCubit.courses[index].image,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    height: 14.w,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        color: MyColors.grey1,
                                        borderRadius:
                                            BorderRadius.circular(1.w),
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
                  itemCount: 5),
            )
          ],
        ));
  }
}
