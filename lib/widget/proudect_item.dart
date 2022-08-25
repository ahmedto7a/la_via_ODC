import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:la_via_hacthon/widget/custom_button.dart';
import 'package:la_via_hacthon/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../core/controller/cart_controller.dart';
import '../model/caart_mode.dart';
import '../model/product_model.dart';

Widget ProductItem({required String name, required imageurl, price,  required Product productModel }) {

  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.topLeft,
    children: [

      Padding(
        padding:  EdgeInsets.only(top: 40.sp),
        child: Card(
          elevation: 1.5,
          child: Container(
            decoration: BoxDecoration(

              border: Border.all(color: Colors.white24),

              borderRadius: BorderRadius.circular(13),
              // color: Colors.blue,

              color: Colors.white,
            ),
            width: double.infinity,
            height: 260.sp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: CustomText(

                    fontSize: 15.sp,
                    text: "${name}",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child:  GetBuilder<CartController>(

                init: CartController(),
                builder:(control)=> CustomText(
                  fontSize: 10.sp,
                  text: "${price} L.E",
                  fontWeight: FontWeight.w600,
                ),
              ),
                ),

                GetBuilder<CartController>(
                    init: CartController(),

                    builder:(controller){
                    return CustomButton(text: "Add To Cart",
                    onpress: ()

  {
  Get.snackbar(
  "The ${productModel.name} Adedd to cart ",
  "Go to Cart",
  backgroundColor: Colors.white,
  borderWidth: 2.5,colorText: Colors.black,
  margin: EdgeInsets.all(20),
  borderColor: Colors.green,
  icon: const Icon(Icons.library_add_check, color: Colors.green,),
  snackPosition: SnackPosition.BOTTOM,
  );

  controller.addProduct(
  CartModel(
  name: "${productModel.name}",
  image: "https://lavie.orangedigitalcenteregypt.com${productModel.imageUrl}",
  price: "${productModel.price}",
  productId: "${productModel.productId}"
  ),
  );
  },

                          // fillColor: Colors.green,
//                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.sp)),
                         // elevation: 2,
                         //  child: Row(
                         //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         //    children: [
                         //
                         //      Container(
                         //        height: 40,
                         //        width: 39,
                         //        decoration: BoxDecoration(color: Colors.white,
                         //          borderRadius: BorderRadius.circular(50.sp),
                         //        ),
                         //        child: Icon(
                         //          Icons.shopping_bag_outlined,
                         //          color: Colors.black,
                         //          size: 24.sp,
                         //        ),
                         //      ),
                         //      Text("Add Cart",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold,color: Colors.grey),),
                         //
                         //    ],
                         //  ),
                          );
                  }
                )


              ],
            ),
          ),
        ),
      ),
      Positioned(
        top: 58.sp,
        right:8.sp,
        child:Container(
              width: 90,
              color: Colors.white24,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    width: 20.sp,
                    height: 20.sp,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,

                    ),
                    // padding: EdgeInsets.only(bottom: 59.sp),

                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/img_minus12.png",fit: BoxFit.cover,),
                      ),
                      onTap: (){


                      },
                    ),
                  ),

                  SizedBox(width:4,),
                  // CustomText(text: controller.cartProudectModel[index].quantity.toString(),color: Colors.black,),

                  CustomText(text: "1",color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),
                  SizedBox(width: 5,),
              Container(
                width: 20.sp,
                height: 20.sp,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,

                ),
                    child: GestureDetector(

                      child: Icon(Icons.add,color: Colors.grey,),
                      onTap: (){
                        // controller.increaseQuantity(index);
                      },
                    ),
                  ),

                ],
              ),
        ),

      ),

      Positioned(
        right: 55.sp,
        bottom: 103.sp,

  child:CachedNetworkImage(
    fit: BoxFit.cover,width: 60.sp,height: 100.sp,
    imageUrl: "https://lavie.orangedigitalcenteregypt.com${imageurl}" ,
    placeholder: (context, imageUrl) => new CircularProgressIndicator(color: Colors.green,),
    errorWidget: (context, url, error) => new Image.asset("assets/images/Lovepik_com-401306819-plant-pot.png",fit: BoxFit.cover,width: 70.sp,height: 120.sp,),
  ),
  ),
    ],
  );
}

