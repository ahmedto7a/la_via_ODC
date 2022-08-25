
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_via_hacthon/viwe_screen/notification_screen.dart';
import 'package:la_via_hacthon/viwe_screen/profile_screen.dart';
import 'package:la_via_hacthon/viwe_screen/scaner_screen.dart';
import 'package:la_via_hacthon/viwe_screen/seeds_screen.dart';
import '../../model/product_model.dart';

import '../../model/user_model.dart';
import '../../viwe_screen/blog_screen.dart';
import '../../viwe_screen/home_screen.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController  {


  // final Rxn<User>? _user = Rxn<User>();
  // String? get userToken => _user?.value?.data.accessToken;


 var tokenn = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJmYWM2NTQwOC1jNDdkLTQxZGQtOTA2Yi04OTM5ZWFiY2E3ZmYiLCJyZWZyZXNoIjp0cnVlLCJpYXQiOjE2NjE0NDM4MjUsImV4cCI6MTY2MjA0ODYyNX0.y395cMUX85gkdRfkQ0XRrpjXsN2DMIBQoM2XrHykYc0";
  ValueNotifier<bool> get loading => _loaging;
  final ValueNotifier<bool> _loaging = ValueNotifier(false);

   // List<Product> get productList => _product;
  final List<Product> product = [];
  // final List<Plant> detailProudect =[];

var tabController ;


  String? baseApi = "https://lavie.orangedigitalcenteregypt.com/api/v1";
  static var client = http.Client();



  getProudect() async {
    loading.value = true;
    try {
      print("ssssssssssssssssssssssssssssssssssss");
      http.Response response =
      await http.get(Uri.parse('$baseApi/products'),
          headers: {
                  "Authorization": "Bearer ${tokenn}",
                  "Accept": "application/json",
                  "Content-Type": "application/json"
                }
      );
      // print("${response.headers}");
      // print("$products");
      //
      print("${response.body}");

      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
//print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$parsed");
  print(parsed["data"].length );
        print(product.length);

  parsed["data"].forEach((element) {
         print(element);
         product.add(Product.fromJson(element));});
    //    print("$parsed");
        print(product.length);
        _loaging.value = false;
      } else {
        throw Exception('Failed to load ');
      }

    } catch (e) {
      _loaging.value = true;
      return print(e);

    }
    update();
  }


//  getDetailProudect() async {
//    loading.value = true;
//    try {
//      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
//      http.Response response =
//      await http.get(Uri.parse('$baseApi/products'),
//          headers: {
//            "Authorization": "Bearer ${tokenn}",
//            "Accept": "application/json",
//            "Content-Type": "application/json"
//          }
//      );
//      // print("${response.headers}");
//      // print("$products");
//      //
//      print("${response.body}");
//
//      if (response.statusCode == 200) {
//        final parsed = json.decode(response.body);
// //print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$parsed");
//        print(parsed["data"].length );
//        print(detailProudect.length);
//
//        parsed["data"].forEach((element) {
//          print(element);
//          detailProudect.add(Plant.fromJson(element));});
//        //    print("$parsed");
//        print(product.length);
//        _loaging.value = false;
//      } else {
//        throw Exception('Failed to load ');
//      }
//
//    } catch (e) {
//      _loaging.value = true;
//      return print(e);
//
//    }
//    update();
//  }




 int _navigatorValue = 2;

  int _currentIndex = 2;

  Widget _currentScreen = HomeScreen() ;

  Widget get currentScreen => _currentScreen;

  get navigatorValue => _navigatorValue;

/// to navigat from screen stoped here
//   final navigationKey = GlobalKey<CurvedNavigationBarState>();


  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        _currentScreen = BlogScreen();
        break;
      case 1:
        _currentScreen = ScannerScreen();
        break;
      case 2:
        _currentScreen = HomeScreen();
        break;
      case 3:
        _currentScreen = NotificationScreen();
        break;
      case 4:
        _currentScreen = ProfileScreen();
        break;
    }
    update();
  }

  get currentIndex => _currentIndex;

  /// make proudect and catigory Related///////////////////////////////////
  /// /// make proudect and catigory Related///////////////////////////////////
  /// /// make proudect and catigory Related///////////////////////////////////

  void changeSelectedCategory(int index) {
    _currentIndex = index;
    update();
  }

  /// List Of Proudect Need Call in Apis /////////////
  ///
  //  List<Product> get productList => _product;
  //
  // List<Product> _product = [
  //   Product(
  //     isAddToCart: false,
  //     category: "Seeds",
  //     id: "1",
  //     name: "Seeds",
  //     price: "10",
  //     imageurl: "assets/images/seeds.png",
  //     description: "Seeds",
  //   ),
  //   Product(
  //     isAddToCart: false,
  //     category: "Seeds",
  //     id: "1",
  //     name: "Seeds",
  //     price: "10",
  //     imageurl: "assets/images/seeds.png",
  //     description: "Seeds",
  //   ),
  //   Product(
  //     isAddToCart: false,
  //     category: "Seeds",
  //     id: "1",
  //     name: "Seeds",
  //     price: "10",
  //     imageurl: "assets/images/seeds.png",
  //     description: "Seeds",
  //   ),
  //   Product(
  //     isAddToCart: false,
  //     category: "Seeds",
  //     id: "1",
  //     name: "Seeds",
  //     price: "10",
  //     imageurl: "assets/images/seeds.png",
  //     description: "Seeds",
  //   ),
  //   Product(
  //     isAddToCart: false,
  //     category: "Seeds",
  //     id: "1",
  //     name: "Seeds",
  //     price: "10",
  //     imageurl: "assets/images/seeds.png",
  //     description: "Seeds",
  //   ),
  //   Product(
  //     isAddToCart: false,
  //     category: "Seeds",
  //     id: "1",
  //     name: "Seeds",
  //     price: "10",
  //     imageurl: "assets/images/seeds.png",
  //     description: "Seeds",
  //   ),
  //   Product(
  //     isAddToCart: false,
  //     category: "Seeds",
  //     id: "1",
  //     name: "Seeds",
  //     price: "10",
  //     imageurl: "assets/images/seeds.png",
  //     description: "Seeds",
  //   ),
  // ];



//
  // List<CategoryModel> get categories => _categories;
  // final List<CategoryModel> _categories = [];
  //
  // List<ProductModel> get products => _products;
  //
  // final List<ProductModel> _products = [];
  //
  //
  // final double _totalPrice = 0.0;
  //
  // double get totalPrice => _totalPrice;


  @override
  void onInit() {
    super.onInit();
    getProudect();
    // getDetailProudect();
    // getCartProducts();
  }
  //
  // // _addFavMeal()async{
  // //   if(favMeals.isEmpty)
  // //
  // // }
  // _getCategoriesFromFireStore() async {
  //   _loaging.value = true;
  //   List<QueryDocumentSnapshot> categoriesSnapshot =
  //   await FirestoreHome().getCategoriesFromFirestore();
  //   for (var category in categoriesSnapshot) {
  //     _categories
  //         .add(CategoryModel.fromJson(category.data() as Map<String, dynamic>));
  //     //print(_categoreModel.length);
  //   }
  //   _loaging.value = false;
  //   update();
  // }
  //
  // _getProductsFromFireStore() async {
  //   _loaging.value = true;
  //   List<QueryDocumentSnapshot> productsSnapshot =
  //   await FirestoreHome().getProductsFromFirestore();
  //   for (var product in productsSnapshot) {
  //     _products
  //         .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
  //   }
  //   _loaging.value = false;
  //   update();
  // }

}