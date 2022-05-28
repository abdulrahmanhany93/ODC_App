import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../consts/colors.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller,
        autoDisposeControllers: false,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            fieldHeight: 16.w,
            fieldWidth: 12.w,
            activeFillColor: MyColors.grey1,
            disabledColor: MyColors.grey1,
            inactiveColor: MyColors.grey1,
            selectedColor: MyColors.grey1,
            selectedFillColor: MyColors.grey1,
            inactiveFillColor: MyColors.grey1,
            borderRadius: BorderRadius.circular(3.w)),
        appContext: context,
        enableActiveFill: true,
        length: 4,
        onChanged: (value) {});
  }
}
