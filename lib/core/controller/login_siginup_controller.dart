import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:la_via_hacthon/model/user_model.dart';
import 'package:la_via_hacthon/viwe_screen/contrrol_screen.dart';
import 'package:la_via_hacthon/widget/search_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../viwe_screen/seeds_screen.dart';
import '../service/local_storge_user.dart';


class LoginController extends GetxController {
  final ValueNotifier<bool> _loaging = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loaging;

  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormState> formKeyy = GlobalKey();
  final Rxn<User>? user = Rxn<User>();
  String? get userToken => user?.value?.data.accessToken;

  //var refreshToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJhYjEwMWE5My1kNjM1LTQ4M2QtODc0Ny1jN2IxYmQ2NmI4ODAiLCJyZWZyZXNoIjp0cnVlLCJpYXQiOjE2NjEwOTkzOTYsImV4cCI6MTY2MTcwNDE5Nn0.vQTGOZkZtnWR4uIHcXYC0bawizGztx3uih5vXMhjWRY";
   var tokenn = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJmYWM2NTQwOC1jNDdkLTQxZGQtOTA2Yi04OTM5ZWFiY2E3ZmYiLCJyZWZyZXNoIjp0cnVlLCJpYXQiOjE2NjE0NDM4MjUsImV4cCI6MTY2MjA0ODYyNX0.y395cMUX85gkdRfkQ0XRrpjXsN2DMIBQoM2XrHykYc0";
  RxBool isSignupScreen = true.obs;
  String? email, password, lastName, firstName;
late TextEditingController emailController, passwordController,
      lastnameController, firstnameController;


  String? baseApi = "https://lavie.orangedigitalcenteregypt.com/api/v1";
  static var client = http.Client();

  login({required String email, required String password}) async {
    try {
      _loaging.value = true;
      var response = await client.post(
        (Uri.parse("$baseApi/auth/signin")),
        headers: {
          // get token from api for user
          "Authorization": "Bearer ${tokenn}",
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, String>
        {
          "email": email,
          "password": password,
        }),
      );
          //.then((user) => saveUser(user));
      print(response.body);
      if (response.statusCode == 200) {

        var data = response.body;
        var user = User.fromJson(json.decode(data));

        _loaging.value = false;

        Get.offAll(ControlScreen()) ;
        return print("${user.data.accessToken}");
      }
    } catch (error) {
      loading.value=false;
      String errorMessage =
      error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Try correct to login..',
        errorMessage,
        backgroundColor: Colors.white,
        colorText: Colors.green,
        snackPosition: SnackPosition.TOP,
        borderWidth: 5,
        borderColor: Colors.green,
      );
    }

    update();
  }

  Future signup(
      {required String email, required String password, required String lastName, required String firstName}) async {
    // print(
    //     {
    //   "email": email,
    //   "password": password,
    //   "firstName": firstName,
    //   "lastName": lastName,
    // }
    // );
    try {
      var response = await client.post(
        (Uri.parse("$baseApi/auth/signup")),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, String>
        {
          "email": email,
          "password": password,
          "firstName": firstName,
          "lastName": lastName,
        }
        ),
      );
      print(response.body);
      if (response.statusCode == 200) {
        var data = response.body;
        var user = User.fromJson(json.decode(data));
        user.data.user.email;
        Get.offAll(ControlScreen());}
    } catch (e) {
      print(e);
    }
    // register({required String email, required String password,required String firstname,required String lastname}) async {
    //   // print({  "email": email,
    //   //   "password": password,});
    //   var response = await client.post(
    //     (Uri.parse("$baseApi/auth/signin")),
    //     headers: {
    //       "Authorization": "Bearer $tokenn",
    //       "Accept": "application/json",
    //       "Content-Type": "application/json"
    //     },
    //     body: jsonEncode (<String, String>
    //     {
    //       "firstName": firstname,
    //       "lastName": lastname,
    //       "email": email,
    //       "password": password,
    //     }),
    //   );
    //   print(response.body);
    //   if(response.statusCode == 200){
    //     var data = response.body;
    //     var user = User.fromJson(json.decode(data));
    //     Get.offAll(ControlScreen());
    //     return print("$user") ;
    //   }
    //
    // }


    // @override
    // void dispose() {
    //   super.onInit();
    //
    //   nameController.dispose();
    //   emailController.dispose();
    //   passwordController .dispose();
    //   lastnameController .dispose();
    //   firstnameController .dispose();
    // }
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    lastnameController = TextEditingController();
    firstnameController = TextEditingController();
    super.onInit();
  }

  // void saveUserLocal(User userModel) async {
  //   await LocalStorageUser.setUserData(userModel);
  // }

}