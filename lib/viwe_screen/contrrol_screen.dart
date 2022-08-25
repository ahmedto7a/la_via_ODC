
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:la_via_hacthon/core/controller/home_controller.dart';
import 'package:la_via_hacthon/core/controller/login_siginup_controller.dart';
import 'package:la_via_hacthon/viwe_screen/login_signup_screen.dart';
import 'package:sizer/sizer.dart';


class ControlScreen extends GetWidget<HomeController> {


  final items = [
    Icon(Icons.travel_explore_outlined, size: 30),
    Icon(Icons.document_scanner_outlined, size: 30),
    Icon(Icons.home_outlined, size: 30, color: Colors.black,),
    Icon(Icons.notifications_none_outlined, size: 30),
    Icon(Icons.person_outline, size: 30)
  ];

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) =>
                Container(
                  color: Colors.black,
                  child: SafeArea(
                    top: false,
                    child: Scaffold(

                      extendBody: true,
                      // backgroundColor: Colors.white,
                      body: controller.currentScreen,
                      bottomNavigationBar: Theme(
                        data: Theme.of(context).copyWith(
                            iconTheme: IconThemeData(color: Colors.black)
                        ),
                        child: CurvedNavigationBar(
                          // key: controller.navigationKey,

                          backgroundColor: Colors.transparent,
                          buttonBackgroundColor: Colors.green,
                          // backgroundColor: Colors.white,
                          animationDuration: Duration(milliseconds: 300),

                          color: Color(0xffededed),
                          height: 55,
                          index: controller.navigatorValue,
                          onTap: (index) {
                            controller.changeSelectedValue(index);
                          },
                          items: items,

                        ),
                      ),

                    ),
                  ),
                ),
            // ),
          );
        }
  }
