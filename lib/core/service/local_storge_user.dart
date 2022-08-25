import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../model/user_model.dart';
class LocalStorageUser extends GetxController{


// Future<UserModel?> get getUserData async{
//
//   try{
//     UserModel? userModel = await _getUserData();
//     if(userModel ==null ){
//       return null;
//     }
//     return userModel;
//   }catch(e){
//     print(e.toString());
//     return null;
//   }
// }


  ///to save all data in local storage by SharedPreferences/////////////////
  static setUserData(Data userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', json.encode(userModel.toJson()));
  }

  static Future<User> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return User.fromJson(
        json.decode(prefs.getString('data')!) as Map<String, dynamic>);
  }

  static clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}
