import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  //const CustomTextField({Key? key}) : super(key: key);

  final String text;
  final Function() onpress;

  CustomButton({required this.text ,required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onpress,
        child: Container(
          width: double.infinity,
          height: 30.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.green,

            border: Border.all(
              color: Colors.green,
              width: 1,
            ),
          ),
          child: Center(child: CustomText(text:text,color: Colors.white,fontSize: 14.sp,alignment: Alignment.center,fontWeight: FontWeight.w500,)),
        ),
      ),
    );
  }
}