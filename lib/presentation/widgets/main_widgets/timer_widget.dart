import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../consts/colors.dart';
import 'package:sizer/sizer.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    Key? key,
    required this.duration,
  }) : super(key: key);
  final int duration;
  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: duration,
      initialDuration: 00,
      controller: CountDownController(),
      width: 15.w,
      height: 15.w,
      ringColor: MyColors.grey1,
      fillColor: MyColors.orange,
      backgroundColor: Colors.white,
      strokeWidth: 4.0,
      strokeCap: StrokeCap.round,
      textStyle: GoogleFonts.roboto(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: MyColors.orange,
      ),
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: () {
        debugPrint('Countdown Ended');
      },
    );
  }
}
