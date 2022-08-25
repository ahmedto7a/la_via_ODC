import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_text.dart';
import 'package:flutter/material.dart';

Widget CustomTextField(

    IconData icon, String hintText,bool isPassword, bool isEmail,String? Function(String?) validatorFn,Function(String?) onSavedFn,TextEditingController control) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0,right:20,top: 10,bottom: 10),
    child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                child: CustomText(text:hintText,color: Colors.grey,fontSize: 12.sp,fontWeight: FontWeight.w500,))),

        Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,

        border: Border.all(
        color: Colors.grey,
        width: 1,
        ),
        ),
          child: TextFormField(

            controller: control,

             obscureText: isPassword,
            keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon:  Icon(
                icon,
                color: Colors.green,
              ),
              contentPadding: EdgeInsets.only(left: 16,right: 12,top: 12,bottom: 12),
              // Text: hintText,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey),

            ),
            validator: validatorFn,
            onSaved: onSavedFn,
          ),
        ),
      ],
    ),
  );
}
// class CustomTextField extends StatelessWidget {
//   //const CustomTextField({Key? key}) : super(key: key);
//
//   final String text;
//   // final String hint;
//   final Function() onSave;
//   final Function() validator;
//   double width;
//   int height;
//   CustomTextField({required this.text ,required this.onSave,required this.validator, this.width= double.infinity, this.height=37});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20.0,right:20,top: 10,bottom: 10),
//       child: Column(
//         children: [
//           Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Align(
//                   child: CustomText(text:text,color: Colors.grey,fontSize: 12.sp,fontWeight: FontWeight.w500,))),
//
//           Container(
//             width: width,
//             height: height.sp,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               color: Colors.white,
//
//               border: Border.all(
//                 color: Colors.grey,
//                 width: 1,
//               ),
//             ),
//             child: TextFormField(
//
//               onSaved:  onSave(),
//               validator: validator(),
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 fillColor: Colors.white70,
//               ),
//             ),
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }
