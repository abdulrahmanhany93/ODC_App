import 'package:flutter/material.dart';
import '../../consts/colors.dart';
import '../../consts/methods.dart';

import '../../consts/routes.dart';
import 'my_text.dart';

class MyCheckBoxTitle extends StatelessWidget {
  const MyCheckBoxTitle(
      {Key? key,
      required this.privacyChecked,
      this.ontap,
      required this.title1,
      required this.title2})
      : super(key: key);
  final bool privacyChecked;
  final void Function(bool?)? ontap;
  final String title1;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, privacyPolicyPage),
      child: Row(
        children: [
          Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: privacyChecked,
            activeColor: MyColors.orange,
            fillColor: privacyChecked
                ? MaterialStateProperty.all(MyColors.orange)
                : MaterialStateProperty.all(MyColors.grey1),
            checkColor: Colors.white,
            onChanged: ontap,
          ),
          ...List.generate(
            2,
            (index) => MyText(
              isFirstItem(index) ? title1 : title2,
              color: isFirstItem(index) ? Colors.black : MyColors.orange,
              underLine: !isFirstItem(index),
            ),
          )
        ],
      ),
    );
  }
}
