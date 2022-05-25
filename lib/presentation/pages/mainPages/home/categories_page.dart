import 'package:flutter/material.dart';
import '../../../../data/models/category_model.dart';
import '../../../consts/methods.dart';
import '../../../widgets/category_widgets/category_widget.dart';
import 'package:sizer/sizer.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key, required this.categories}) : super(key: key);
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: basicAppBar(context, 'Categories'),
        body: GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.5),
          itemBuilder: (context, index) {
            return CategoryWidget(category: categories[index]);
          },
        ));
  }
}
