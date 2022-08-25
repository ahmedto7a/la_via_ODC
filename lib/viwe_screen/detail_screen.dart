import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:la_via_hacthon/core/controller/home_controller.dart';
import 'package:sizer/sizer.dart';

import '../model/product_model.dart';


class DetailScreen extends StatelessWidget {
  final Product product;
  DetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       GestureDetector(
            //         onTap: () => Navigator.pop(context),
            //         child: Icon(
            //           Icons.arrow_back,
            //           size: 30,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            productImage(),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 18, top: 28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.grey.shade200,
                  ),
                  child: productDescription()),
            ),
          ],
        ),
      ),
    );
  }
  Widget productImage() {
    return Stack(
      children: [
        Container(
          height: 250.sp,
          width: double.infinity,
    //     decoration: BoxDecoration(
    //     image: DecorationImage(
    //       fit: BoxFit.contain,
    //       image: AssetImage(product.imageurl),
    //     image: AssetImage(),
    //     colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.hardLight),
    //       // child: Center(
    //       //   child: Image.asset(
    //       //
    //       //     '${product.image}',
    //       //     height: 250.sp,
    //       //     fit: BoxFit.cover,
    //       //   ),
    //       // ),
    // ),
    //     ),

          child:CachedNetworkImage(
            imageUrl: "rdtfgyubhnjmk,l;" ,
            placeholder: (context, imageUrl) => new CircularProgressIndicator(color: Colors.green,),
            errorWidget: (context, url, error) => new Image.asset("assets/images/Lovepik_com-401306819-plant-pot.png",fit: BoxFit.cover,width: 70.sp,height: 120.sp,),
          ),

          //Image.network("${product.imageUrl}"),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50.sp,
                      width: 50.sp,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child:Icon(Icons.ac_unit_outlined,color: Colors.white,),

                      ),
                    ),
                    Text(
                      // '${product.price}',
                     '${product.price}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.sp,),
                Row(
                  children: [
                    Container(
                      height: 50.sp,
                      width: 50.sp,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child:Icon(Icons.ac_unit_outlined,color: Colors.white,),

                      ),
                    ),
                    Text(
                      '${product.price}',
                      // '${product.plant!.waterCapacity}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.sp,),
                Row(
                  children: [
                    Container(
                      height: 50.sp,
                      width: 50.sp,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child:Icon(Icons.ac_unit_outlined,color: Colors.white,),

                      ),
                    ),
                    Text(
                      '${product.price}',
                      // '${product.plant!.waterCapacity}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget productDescription() {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (context) {
        return ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
            crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(
                 '${product.name}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Text(
                     '${product.description}',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Text(
                '${product.description}',
              ),
            ),
            SizedBox(
              height: 14,
            ),

          ],
        );
      }
    );
  } 
}