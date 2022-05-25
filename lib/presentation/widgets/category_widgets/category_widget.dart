import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_text.dart';
import '../../../data/models/category_model.dart';
import '../../consts/routes.dart';
import 'package:sizer/sizer.dart';

import '../../consts/colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, categoryPage, arguments: category),
      child: Column(
        children: [
          Container(
            height: 19.w,
            width: 19.w,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
                color: MyColors.lightGrey,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      offset: Offset(0, 1.w))
                ],
                borderRadius: BorderRadius.circular(4.5.w)),
            child: CachedNetworkImage(
              imageUrl: category.image,
              errorWidget: (context, url, s) => const Center(
                  child: CircularProgressIndicator(color: MyColors.orange)),
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: MyColors.orange)),
              width: 8.w,
              height: 8.w,
              fit: BoxFit.contain,
            ),
          ),
          MyText(
            category.name,
            textAlign: TextAlign.center,
            fontSize: 8.sp,
            height: 0.25.h,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
