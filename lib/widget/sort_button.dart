import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viwe_screen/cart_screen.dart';

Widget SortButton() {
  return GestureDetector(
    onTap: (){
      Get.to(CartScreen());

    },
    child: Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.shopping_cart_outlined,
        color: Colors.white,
        size: 30,
      ),
    ),
  );
}
