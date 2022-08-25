import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_via_hacthon/core/controller/home_controller.dart';
import 'package:la_via_hacthon/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../core/controller/cart_controller.dart';
import '../model/product_model.dart';
import '../widget/proudect_item.dart';
import 'detail_screen.dart';
class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      GetBuilder<HomeController>(
        init: HomeController(),
    builder: (controller) =>

        Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomText(color: Colors.black ,fontWeight:FontWeight.bold,text:"Blogs" ,alignment: Alignment.center, fontSize: 15.sp,),
      ),
      body:
      Column(
        children: [
          SizedBox(
            height: 10.sp,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.product.length,
              itemBuilder: (BuildContext, int index) {
    return

      GestureDetector(
    onTap: () {

    Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) => DetailScreen(product: controller.product[index],

    ),

    //     DetailScreen(
    //       detailProudect: controller.detailProudect[index],
    //   // detailProudect: controller.detailProudect[index],
    // ),
    //),
    ),
    );


    // );
    },
    child:
    // ProductItem(
    //
    // name: "${controller.product[index].name}",
    // imageurl: "${controller.product[index].imageUrl}",
    // price: "${controller.product[index].price}",
    // productModel:Product(
    //
    // productId:"${controller.product[index].productId}" ,
    // name: "${controller.product[index].name}",
    // description:"${controller.product[index].description}" ,
    // imageUrl: "${controller.product[index].imageUrl}",
    // type: "${controller.product[index].type}",
    // price: controller.product[index].price,
    // available: controller.product[index].available ,
    // ),
    //
    // // isAddToCart: Random().nextBool(),
    // ),
    // );
    // },
               Padding(
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

                                  imageUrl: "https://lavie.orangedigitalcenteregypt.com${controller.product[index].imageUrl}",
                                  //"${ controller.cartProducts[index].image}" ,
                                  placeholder: (context, imageUrl) => new CircularProgressIndicator(color: Colors.green,),
                                  errorWidget: (context, url, error) => new Image.asset("assets/images/Lovepik_com-401501120-cute-indoor-plants-illustration-image.png",fit: BoxFit.cover,width: 70.sp,height: 120.sp,),
                                ),
                                // backgroundColor: Colors.grey,
                                // minRadius: 3,
                              ),
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Text(
                                  "2 days",
                                  // controller.cartProducts[index].name,
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 4,),

                                Text(
                                  "5 Tips blalalalal",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(height: 7,),
                                Text(
                                  "qwerdtfyuhjkm,l.;/dssdddsa\nqwerdtfyuhjkm,l.;/dssdddsasssc",

                                   style: TextStyle(
                                      color: Colors.grey,

                                      fontWeight: FontWeight.w400),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  // softWrap: false,

                                ),

                                /// counter /////////////////////////////////////////
                                /// counter /////////////////////////////////////////

                                /// counter /////////////////////////////////////////
                                /// counter /////////////////////////////////////////
                              ],
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
               ),
                );
              },
            ),
          ),

        ],

      ),
     ),
    );
  }
}
