import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget CategoryItem({bool isActived = false, required String title}) {
  return
    Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.green)
    ),
    // color: Colors.green,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: TextStyle(
              color: isActived ? Colors.green : Colors.grey,
              fontWeight: FontWeight.bold),
        ),

        // Container(
        //   margin: EdgeInsets.only(top: 5),
        //   height: 4,
        //   width: 35,
        //   decoration: isActived
        //       ? BoxDecoration(
        //     border: Border.all(color: Colors.green,width: 1),
        //     color: Colors.green,
        //     borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        //   )
        //       : BoxDecoration(),
        // )
      ],
    ),
  );
}
