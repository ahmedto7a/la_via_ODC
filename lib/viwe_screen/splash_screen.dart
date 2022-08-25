import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:la_via_hacthon/viwe_screen/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'contrrol_screen.dart';
import 'login_signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
    duration: 2500,
    splash: Image.asset("assets/images/Group 1000003301.png",width: 200.sp,height: 250.sp,),
    nextScreen: ControlScreen(),
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    backgroundColor: Colors.white,

    );
  }
}