
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

import '../core/controller/cart_controller.dart';
import '../widget/custom_text.dart';



class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
       backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Cart",style: TextStyle(fontSize: 23.sp,color: Colors.green),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) => controller.cartProducts.isEmpty
            ? Center(
          child: ColumnnSVG(),
        )
            : Column(
          children: [
               SizedBox(
             height: 10.sp,
             ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.cartProducts.length,
                itemBuilder: (BuildContext, int index) {
                  return Padding(
                    padding: EdgeInsets.all(10.0.sp),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.white),
                          ),
                          height: 100.sp,
                          width: double.infinity,
                          child: Row(
                             // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.sp, right: 10.sp,top: 10.sp,bottom: 10.sp),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color:  Colors.grey[100]
                                  ),
                                  child:CachedNetworkImage(
                                    fit: BoxFit.cover,width: 60.sp,height: 100.sp,
                                    imageUrl: "${controller.cartProducts[index].image}" ,
                                    placeholder: (context, imageUrl) => new CircularProgressIndicator(color: Colors.green,),
                                    errorWidget: (context, url, error) => new Image.asset("assets/images/Lovepik_com-401306819-plant-pot.png",fit: BoxFit.cover,width: 70.sp,height: 120.sp,),
                                  ),
                                  // child:CachedNetworkImage(
                                  //
                                  //   imageUrl: "${ controller.cartProducts[index].image}" ,
                                  //   placeholder: (context, imageUrl) => new CircularProgressIndicator(color: Colors.green,),
                                  //   errorWidget: (context, url, error) => new Image.asset("assets/images/Lovepik_com-401501120-cute-indoor-plants-illustration-image.png",fit: BoxFit.cover,width: 70.sp,height: 120.sp,),
                                  // ),
                                  // backgroundColor: Colors.grey,
                                  // minRadius: 3,
                                ),
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    controller.cartProducts[index].name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "${controller.cartProducts[index].price.toString()} L.E",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w800),
                                  ),

                                  /// counter /////////////////////////////////////////
                                  /// counter /////////////////////////////////////////
                                  Container(
                                    // width:50.sp,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                        color:  Colors.grey[100]
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                      GestureDetector(

                                            child: Icon(
                                              Icons.add,
                                              color: Colors.green,

                                            ),
                                            onTap: ()=>controller.increaseQuantity(index),
                                          ),

                                        SizedBox(
                                          width: 5.sp,
                                        ),
                                        /// ////////////////////////////////////////////////////////////////////
                                        /// ////////////////////////////////////////////////////////////////////

                                        /// ////////////////////////////////////////////////////////////////////
                                        Text(
                                          "${controller.cartProducts[index].quantity}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5.sp,
                                        ),
                                        GestureDetector(
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 8.0),
                                            child: Icon(
                                              Icons.minimize,
                                              color: Colors.green,
                                            ),
                                          ),
                                          onTap: () {
                                            controller.decreaseQuantity(index);
                                            // print("${controller.decreaseQuantity(index)}");
                                          },
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// counter /////////////////////////////////////////
                                  /// counter /////////////////////////////////////////
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom:10,

                          child: GestureDetector(
                            onTap:(){
                              controller.removeProduct(controller.cartProducts[index].productId);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.sp),
                              child: Icon(
                                Icons.delete,
                                color: Colors.green,
                                size: 25.sp,
                              ),
                            ),
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: GestureDetector(
                        //     onTap:(){
                        //       controller.removeProduct(controller.cartProducts[index].productId);
                        //     },
                        //     child: Container(
                        //       padding: EdgeInsets.all(10.sp),
                        //       child: Icon(
                        //         Icons.delete,
                        //         color: Colors.green,
                        //         size: 25.sp,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Expanded(child: SizedBox()),
            Material(
              elevation: 5,
              child: Container(

                width: double.infinity,
                height: 120.sp,
                color: Colors.white24,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0,right: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SizedBox(height: 19,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          CustomText(text: "ToTal",color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w600,),
                          SizedBox(height: 4.sp,),
                          GetBuilder<CartController>(
                              init: CartController(),
                              builder:(controller)=> CustomText(text:"${controller.totalPrice} L.E",fontSize: 15.sp,color:Colors.green,fontWeight: FontWeight.w600,))
                        ],
                      ),
                      SizedBox(height: 19,),

                      GestureDetector(
                        // onTap: (){
                        //   Get.to(CheckOutScreen());
                        // },
                        child: Container(
                          decoration: BoxDecoration(color: Colors.green,

                              borderRadius: BorderRadius.all(Radius.circular(15)),

                          ),

                          height: 40.sp,
                          width: double.infinity,
                          child: CustomText(text: "Checkout",color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20,alignment: Alignment.center,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],

        ),
      ),
      );
  }

  Widget ColumnnSVG() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/images/undraw_empty_cart_co35 (2).svg",
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Cart Empty",
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}


//
//
