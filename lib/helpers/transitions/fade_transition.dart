import 'package:flutter/cupertino.dart';
import '../../presentation/consts/fixed_variables.dart';

class PageTransition extends PageRouteBuilder {
  final Widget widget;

  PageTransition.fade({required this.widget})
      : super(
          transitionDuration: FixedVariables.myDuration,
          pageBuilder: (
            context,
            a1,
            a2,
          ) {
            return widget;
          },
          transitionsBuilder: (context, a1, a2, widget) {
            a1 = CurvedAnimation(parent: a1, curve: Curves.fastOutSlowIn);
            return FadeTransition(
              opacity: a1,
              child: widget,
            );
          },
        );
}
