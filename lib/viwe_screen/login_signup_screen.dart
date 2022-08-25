import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:la_via_hacthon/core/controller/login_siginup_controller.dart';
import 'package:la_via_hacthon/widget/custom_button.dart';
import 'package:la_via_hacthon/widget/custom_text.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/custom_textFormField.dart';

class LoginScreen extends GetWidget<LoginController> {

  // const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height:90.sp,
                  width:90.sp,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/image 68 (Traced).png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SingleChildScrollView(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 35.sp,
                    ),
                    Container(
                      height: 120.sp,
                      width: 120.sp,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Group 1000003301.png", ),

                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.isSignupScreen.value = false;
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: !controller.isSignupScreen.value
                                              ? Colors.green
                                              : Colors.grey
                                      ),
                                    ),
                                    if (!controller.isSignupScreen.value)
                                      Container(
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2,
                                        width: 55,
                                       color: Colors.green,
                                      )
                                  ],
                                ),
                              ),
                              SizedBox(width: 35.sp,),
                              GestureDetector(
                                onTap: () {
                                  controller.isSignupScreen.value = true;

                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "SIGNUP",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                          controller.isSignupScreen.value
                                              ? Colors.green
                                              : Colors.grey
                                      ),
                                    ),
                                     if (controller.isSignupScreen.value)
                                      Container(
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2,
                                        width: 55,
                                        color: Colors.green,
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                          if (controller.isSignupScreen.value) buildSignupSection(),
                          if (!controller.isSignupScreen.value) buildSigninSection(),
                        ],
                      ),
                    ),
                   CustomButton(text: !controller.isSignupScreen.value? "Login":"Sign Up",

                       onpress:      (){
                         if(controller.isSignupScreen.value==true){
                           controller.formKeyy.currentState!.save();
                           if (controller.formKeyy.currentState!.validate()) {
                             controller.signup(email: controller.emailController.text.toString(), password: controller.passwordController.text.toString(),firstName: controller.firstnameController.text.toString(),lastName: controller.lastnameController.text.toString()

                             );
                           }

                         }
                         else if(controller.isSignupScreen.value == false) {
                           controller.formKey.currentState!.save();
                           if (controller.formKey.currentState!.validate()) {
                             controller.login(email: controller.emailController.text.toString(), password: controller.passwordController.text.toString()
                             );
                           }
                         }
                       },

                   //         (){
                   //
                   //   Get.to(ControlScreen());
                   // }
                   ),
                    Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider(
                                indent: 36.sp,
                                color: Colors.grey,
                              ),
                          ),
                       CustomText(text:"Or continue with",color: Colors.grey,fontWeight: FontWeight.w600,),

                          Expanded(
                              child: Divider(
                                endIndent: 36.sp,

                                color: Colors.grey,

                              )
                          ),

                        ]
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: (){},
                              child: SvgPicture.asset("assets/images/img_google.svg",height: 25,width: 25,fit: BoxFit.contain,)),
                    SizedBox(width: 14.sp,),
                          GestureDetector(
                              onTap: (){},
                              child: SvgPicture.asset("assets/images/img_facebook.svg",height: 25,width: 25,fit: BoxFit.contain,)),

                        ]
                    ),

                  ],
                ),
              ),


              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height:80.sp,
                  width:80.sp,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/image 68 (Traced) (2).png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],

          )
      ),
    );
  }
  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(Icons.mail_outline, "Email", false, true, (value){if(value!.isEmpty){return "Please Enter Your Email";}return null;}, (value){ controller.email=value!;},controller.emailController),
              SizedBox(height: 8,),
              CustomTextField(Icons.lock_outline, "password", true, false ,(value){if(value!.isEmpty){return "Please Enter Your password";}return null;}, (value){ controller.password=value!;},controller.passwordController),
              // CustomTextField(
              //   text: "Email",
              //   // hint: "Enter your email",
              //   onSave: (){},
              //   validator: (){},
              // ),
              // CustomTextField(
              //   text: "Password",
              //   // hint: "Enter your email",
              //   onSave: (){},
              //   validator: (){},
              // ),


              /// /////////Cheack Box///////////////////////////////
              /// /// ///////// Forget Pass /// Forget Pass ///////////////////////////////
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     // Row(
              //     //   children: [
              //     //     Checkbox(
              //     //       value: isRememberMe,
              //     //       activeColor: AppColor.primary,
              //     //       onChanged: (value) {
              //     //         setState(() {
              //     //           isRememberMe = !isRememberMe;
              //     //         });
              //     //       },
              //     //     ),
              //     //     Text("Remember me",
              //     //         style: TextStyle(fontSize: 12, color: Palette.textColor1))
              //     //   ],
              //     // ),
              //
              //     // TextButton(
              //     //   onPressed: () {
              //     //     // Get.to(ForgotPasswordScreen());
              //     //   },
              //     //   child: Text("",
              //     //       style: TextStyle(fontSize: 17, color: AppColor.primary)),
              //     // )
              //   ],
              // ),
            ],

          ),
        ),
      ),
    );
  }
  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: controller.formKeyy,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(Icons.person_outline_sharp, "Firs Name",
                      false, false ,(value){if(value!.isEmpty){return "PlEease nter Firs name";}return null;}, (value){controller.firstName=value!;} ,controller.firstnameController),
                  ),
                  SizedBox(width: 10.sp,),
                  Expanded(
                    child: CustomTextField(Icons.person_outline_sharp, "Last Name",
                      false, false ,(value){if(value!.isEmpty){return "Please Enter Last name";}return null;}, (value){controller.lastName=value!;},controller.lastnameController),
                  ),
                  // Expanded(
                  //   child: CustomTextField(
                  //     width: 40.w,
                  //     height: 37,
                  //     text: "First Name",
                  //     // hint: "Enter your email",
                  //     onSave: (){},
                  //     validator: (){},
                  //   ),
                  // ),
                  // SizedBox(width: 10.sp,),
                  // Expanded(
                  //   child: CustomTextField(
                  //     width: 40.w,
                  //     height: 37,
                  //     text:"Last Name",
                  //     // hint: "Enter your email",
                  //     onSave: (){},
                  //     validator: (){},
                  //   ),
                  // ),

                ],
              ),
              CustomTextField(Icons.email_outlined, "email", false, true ,(value){if(value!.isEmpty){return "Please Enter Your Email";}return null;}, (value){controller.email=value !;},controller.emailController),

              CustomTextField(Icons.lock_outline, "password", true, false,(value){if(value!.isEmpty){return "Please Enter Your password";}return null;}, (value){controller.password=value!;},controller.passwordController),
            ],

          ),
        ),
      ),
    );
  }

}
