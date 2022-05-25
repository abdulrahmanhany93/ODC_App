import 'package:flutter/material.dart';
import '../../consts/fixed_variables.dart';
import 'my_form.dart';

class SignUpForms extends StatelessWidget {
  const SignUpForms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      children: List.generate(
          5,
          (index) => MyForm(
                title: FixedVariables.logInRequirments.keys.elementAt(index),
                image: FixedVariables.logInRequirmentsIcons[index],
                controller:
                    FixedVariables.logInRequirments.values.elementAt(index),
              )),
    );
  }
}
