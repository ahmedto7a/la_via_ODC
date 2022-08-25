import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:la_via_hacthon/core/controller/home_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../model/product_model.dart';
import '../widget/category_item.dart';
import '../widget/proudect_item.dart';
import '../widget/search_box.dart';
import '../widget/sort_button.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  // String? baseApi = "https://lavie.orangedigitalcenteregypt.com/api/v1";

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TweenAnimationBuilder(
          child: Container(
            margin: EdgeInsets.only(top: 18, left: 14, right: 14),
            width: double.infinity,
            // color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.sp),
                    child: GestureDetector(
                        onTap: () {

                        },
                        child: Image.asset(
                          "assets/images/Group 1000003301.png",
                          fit: BoxFit.contain,
                        )),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 35),
                    child: Row(
                      children: [SearchBox(), SortButton()],
                    ),
                  ),

                  Column(
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            indicatorColor: Colors.green,
                            labelColor: Colors.green,
                            unselectedLabelColor: Colors.grey,
                            controller: _tabController,
                            labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                            tabs: [
                              Tab(text: "All"),
                              Tab(text: "Plant"),
                              Tab(text: "Seeds"),
                              Tab(text: "Tools"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 285.sp,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            GetBuilder<HomeController>(
                              init: HomeController(),
                              builder: (controller) =>
                                  controller.loading.value == true
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 188.0, left: 24, right: 24),
                                          child: Center(
                                              child: CircularProgressIndicator(
                                            color: Colors.green,
                                          )),
                                        )
                                      : StaggeredGridView.countBuilder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          crossAxisCount: 4,
                                          itemCount: controller.product.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return GestureDetector(
                                              onTap: (){

                                                print(" ${controller.product[index].imageUrl}");
                                              },
                                                //
                                                child: ProductItem(



                                                  name: "${controller.product[index].name}",

                                                  imageurl: " ${controller.product[index].imageUrl}",

                                                  price: "${controller.product[index].price}",
                                                  productModel:Product(

                                                      productId:"${controller.product[index].productId}" ,
                                                      name: "${controller.product[index].name}",
                                                      description:"${controller.product[index].description}" ,
                                                      imageUrl: "${controller.product[index].imageUrl}",
                                                      type: "${controller.product[index].type}",
                                                      price: controller.product[index].price,
                                                      available: controller.product[index].available ,
                                                  ),


                                                  // isAddToCart: Random().nextBool(),

                                                ),

                                                );
                                          },
                                          staggeredTileBuilder: (int index) =>
                                              new StaggeredTile.count(
                                                  2, index.isEven ? 3 : 3),
                                          mainAxisSpacing: 18.0,
                                          crossAxisSpacing: 18.0,
                                        ),
                            ),
                            GetBuilder<HomeController>(
                              init: HomeController(),
                              builder: (controller) =>
                              controller.loading.value == true
                                  ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 188.0, left: 24, right: 24),
                                child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.green,
                                    )),
                              )
                                  : StaggeredGridView.countBuilder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                crossAxisCount: 4,
                                itemCount: controller.product.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return GestureDetector(

                                    //
                                    child: ProductItem(



                                      name: "${controller.product[index].name}",

                                      imageurl: "${controller.product[index].imageUrl}",

                                      price: "${controller.product[index].price}",
                                      productModel:Product(

                                        productId:"${controller.product[index].productId}" ,
                                        name: "${controller.product[index].name}",
                                        description:"${controller.product[index].description}" ,
                                        imageUrl: "${controller.product[index].imageUrl}",
                                        type: "${controller.product[index].type}",
                                        price: controller.product[index].price,
                                        available: controller.product[index].available ,
                                      ),


                                      // isAddToCart: Random().nextBool(),

                                    ),

                                  );
                                },
                                staggeredTileBuilder: (int index) =>
                                new StaggeredTile.count(
                                    2, index.isEven ? 3 : 3),
                                mainAxisSpacing: 18.0,
                                crossAxisSpacing: 18.0,
                              ),
                            ),
                            GetBuilder<HomeController>(
                              init: HomeController(),
                              builder: (controller) =>
                              controller.loading.value == true
                                  ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 188.0, left: 24, right: 24),
                                child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.green,
                                    )),
                              )
                                  : StaggeredGridView.countBuilder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                crossAxisCount: 4,
                                itemCount: controller.product.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return GestureDetector(

                                    //
                                    child: ProductItem(



                                      name: "${controller.product[index].name}",

                                      imageurl: "${controller.product[index].imageUrl}",

                                      price: "${controller.product[index].price}",
                                      productModel:Product(

                                        productId:"${controller.product[index].productId}" ,
                                        name: "${controller.product[index].name}",
                                        description:"${controller.product[index].description}" ,
                                        imageUrl: "${controller.product[index].imageUrl}",
                                        type: "${controller.product[index].type}",
                                        price: controller.product[index].price,
                                        available: controller.product[index].available ,
                                      ),


                                      // isAddToCart: Random().nextBool(),

                                    ),

                                  );
                                },
                                staggeredTileBuilder: (int index) =>
                                new StaggeredTile.count(
                                    2, index.isEven ? 3 : 3),
                                mainAxisSpacing: 18.0,
                                crossAxisSpacing: 18.0,
                              ),
                            ),
                            GetBuilder<HomeController>(
                              init: HomeController(),
                              builder: (controller) =>
                              controller.loading.value == true
                                  ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 188.0, left: 24, right: 24),
                                child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.green,
                                    )),
                              )
                                  : StaggeredGridView.countBuilder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                crossAxisCount: 4,
                                itemCount: controller.product.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return GestureDetector(

                                    //
                                    child: ProductItem(



                                      name: "${controller.product[index].name}",

                                      imageurl: "${ controller.product[index].imageUrl}",

                                      price: "${controller.product[index].price}",
                                      productModel:Product(

                                        productId:"${controller.product[index].productId}" ,
                                        name: "${controller.product[index].name}",
                                        description:"${controller.product[index].description}" ,
                                        imageUrl: "${controller.product[index].imageUrl}",
                                        type: "${controller.product[index].type}",
                                        price: controller.product[index].price,
                                        available: controller.product[index].available ,
                                      ),


                                      // isAddToCart: Random().nextBool(),

                                    ),

                                  );
                                },
                                staggeredTileBuilder: (int index) =>
                                new StaggeredTile.count(
                                    2, index.isEven ? 3 : 3),
                                mainAxisSpacing: 18.0,
                                crossAxisSpacing: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Container(
                  //   child: TabBar(
                  //     labelColor:  Colors.green,
                  //     unselectedLabelColor: Colors.grey,
                  //     controller: _tabController,
                  //     tabs: [
                  //       Tab(text: "all"),
                  //       Tab(text: "Plant"),
                  //       Tab(text: "seeds"),
                  //
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   height: 300.sp,
                  //   child: TabBarView(
                  //     controller: _tabController,
                  //     children: [
                  //       GetBuilder<HomeController>(
                  //         init: HomeController(),
                  //         builder:(controller)=> controller.loading.value== true ? Padding(
                  //           padding: const EdgeInsets.only(top: 188.0,left: 24,right: 24),
                  //           child: Center(child: CircularProgressIndicator(color:Colors.green,)),
                  //         )
                  //             : Expanded(
                  //           child: StaggeredGridView.countBuilder(
                  //             shrinkWrap: true,
                  //             // physics: BouncingScrollPhysics(),
                  //             crossAxisCount: 4,
                  //             itemCount:controller.product.length,
                  //             itemBuilder: (BuildContext context, int index) {
                  //               return GestureDetector(
                  //                 onTap: () {
                  //
                  //                   Navigator.of(context).push(
                  //                     MaterialPageRoute(
                  //                       builder: (context) => DetailScreen(
                  //                         product: controller.product[index],
                  //                       ),
                  //                     ),);
                  //
                  //
                  //                   // );
                  //                 },
                  //                 child: ProductItem(
                  //
                  //                   name: "${controller.product[index].name}",
                  //                   imageurl: "${controller.product[index].imageUrl}",
                  //                   price: "${controller.product[index].price}",
                  //                   // isAddToCart: Random().nextBool(),
                  //                 ),
                  //               );
                  //             },
                  //             staggeredTileBuilder: (int index) =>
                  //             new StaggeredTile.count(2, index.isEven ? 3:3),
                  //             mainAxisSpacing: 18.0,
                  //             crossAxisSpacing:18.0,
                  //           ),
                  //
                  //         ),
                  //       ),
                  //
                  //       Text("tegeg"),
                  //       Text("getet"),
                  //
                  //     ],
                  //
                  //   ),
                  // ),

                  // SizedBox(
                  //   height: 24,
                  // ),

                  // GetBuilder<HomeController>(
                  //   init: HomeController(),
                  //   builder:(controller)=> controller.loading.value== true ? Padding(
                  //     padding: const EdgeInsets.only(top: 188.0,left: 24,right: 24),
                  //     child: Center(child: CircularProgressIndicator(color:Colors.green,)),
                  //   )
                  //       : Expanded(
                  //     child: StaggeredGridView.countBuilder(
                  //       shrinkWrap: true,
                  //       // physics: BouncingScrollPhysics(),
                  //       crossAxisCount: 4,
                  //       itemCount:controller.product.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return GestureDetector(
                  //           onTap: () {
                  //
                  //             Navigator.of(context).push(
                  //               MaterialPageRoute(
                  //                 builder: (context) => DetailScreen(
                  //                   product: controller.product[index],
                  //                 ),
                  //               ),);
                  //
                  //
                  //             // );
                  //           },
                  //           child: ProductItem(
                  //
                  //             name: "${controller.product[index].name}",
                  //             imageurl: "${controller.product[index].imageUrl}",
                  //             price: "${controller.product[index].price}",
                  //             // isAddToCart: Random().nextBool(),
                  //           ),
                  //         );
                  //       },
                  //       staggeredTileBuilder: (int index) =>
                  //       new StaggeredTile.count(2, index.isEven ? 3:3),
                  //       mainAxisSpacing: 18.0,
                  //       crossAxisSpacing:18.0,
                  //     ),
                  //
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 2000),
          builder: (BuildContext context, double _value, child) {
            return Opacity(
              opacity: _value,
              child: Padding(
                padding: EdgeInsets.only(bottom: _value * 50),
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}

// class HomeScreen extends GetWidget<HomeController>{
//
//   @override
// //   _HomeScreenState createState() =>
// //       _HomeScreenState();
// // }
// //
// //
// // class _HomeScreenState
// //     extends State<HomeScreen> {
// //   @override
//   Widget build(BuildContext context) {
//     TabController tabController =TabController(length: 3, vsync: this);
// Get.put(HomeController());
//     return SafeArea(
//       child: Scaffold(
// backgroundColor: Colors.white,
//         body: TweenAnimationBuilder(
//           child:
//
//           Container(
//             margin: EdgeInsets.only(top: 18, left: 14, right: 14),
//             width: double.infinity,
//             // color: Colors.black,
//             child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//
//                 Padding(
//                   padding:  EdgeInsets.only(top: 10.sp),
//                   child: Image.asset("assets/images/Group 1000003301.png",fit: BoxFit.contain,),
//                 ),
//
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 35),
//                   child: Row(
//                     children: [SearchBox(), SortButton()],
//                   ),
//                 ),
//
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //   children: [
//                 //     CategoryItem(title: 'All', isActived: true),
//                 //     CategoryItem(title: 'Plant'),
//                 //     CategoryItem(title: 'INDOORS'),
//                 //     CategoryItem(title: 'SYNTHETIC'),
//                 //   ],
//                 // ),
//
//
//                 Container(
//                   child: TabBar(
//                     controller: tabController,
//                     tabs: [
//                       Tab(text: "all",),
//                       Tab(text: "Plant"),
//                       Tab(text: "seeds"),
//
//                     ],
//                   ),
//                 ),
//                 Container(
//                   child: TabBarView(
//                     children: [
//                       Text("Hi"),
//                       Text("tegeg"),
//                       Text("getet"),
//
//                     ],
//
//                   ),
//                 ),
//
//                 SizedBox(
//                   height: 24,
//                 ),
//
//
//                 GetBuilder<HomeController>(
//                   init: HomeController(),
//                   builder:(controller)=> controller.loading.value== true ? Padding(
//                     padding: const EdgeInsets.only(top: 188.0,left: 24,right: 24),
//                     child: Center(child: CircularProgressIndicator(color:Colors.green,)),
//                   )
//                       : Expanded(
//                     child: StaggeredGridView.countBuilder(
//                       shrinkWrap: true,
//                       // physics: BouncingScrollPhysics(),
//                       crossAxisCount: 4,
//                       itemCount:controller.product.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return GestureDetector(
//                           onTap: () {
//
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => DetailScreen(
//                                   product: controller.product[index],
//                                 ),
//                               ),);
//
//
//                             // );
//                           },
//                           child: ProductItem(
//
//                             name: "${controller.product[index].name}",
//                             imageurl: "${controller.product[index].imageUrl}",
//                             price: "${controller.product[index].price}",
//                              // isAddToCart: Random().nextBool(),
//                           ),
//                         );
//                       },
//                       staggeredTileBuilder: (int index) =>
//                       new StaggeredTile.count(2, index.isEven ? 3:3),
//                       mainAxisSpacing: 18.0,
//                       crossAxisSpacing:18.0,
//                     ),
//
//                   ),
//                 ),
//
//
//
//
//               ],
//             ),
//           ),
//           tween: Tween<double>(begin: 0, end: 1),
//           duration: Duration(milliseconds: 2000),
//           builder: (BuildContext context, double _value, child) {
//             return Opacity(
//               opacity: _value,
//               child: Padding(
//                 padding: EdgeInsets.only(bottom: _value * 50),
//                 child: child,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
