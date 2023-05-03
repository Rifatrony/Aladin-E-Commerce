import 'package:aladin_ecommerce/view_model/accounts/profile_view_model.dart';
import 'package:aladin_ecommerce/view_model/banner/banner_view_model.dart';
import 'package:aladin_ecommerce/view_model/category/category_view_model.dart';
import 'package:aladin_ecommerce/view_model/product/feature_product_view_model.dart';
import 'package:aladin_ecommerce/view_model/product/latest_view_model.dart';
import 'package:aladin_ecommerce/view_model/product/top_in_categories_view_model.dart';
import 'package:aladin_ecommerce/views/category_wise_product_screen.dart';
import 'package:aladin_ecommerce/views/customized_order_screen.dart';
import 'package:aladin_ecommerce/views/product_details_screen.dart';
import 'package:aladin_ecommerce/widgets/app_text.dart';
import 'package:aladin_ecommerce/widgets/title_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final profileViewModel = Get.put(ProfileViewModel());
  final featureViewModel = Get.put(FeatureViewModel());
  final latestViewModel = Get.put(LatestViewModel());
  final topInCategoriesViewModel = Get.put(TopInCategoriesViewModel());
  final categoryViewModel = Get.put(CategoryViewModel());
  final bannerViewModel = Get.put(BannerViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      // drawer: const Navbar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade50,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Aladin BD Online",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 16),
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SearchWidget(),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 14,
                          )),
                    )
                  ],
                ),
              ),
            ),
            Obx(
              () => bannerViewModel.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount:
                              bannerViewModel.banners.value.data?.length ?? 0,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            final banner =
                                bannerViewModel.banners.value.data![index];
                            return SizedBox(
                              width: double.infinity,
                              height:
                                  200.0, // Set the height of the container to control the size of the image
                              child: Image(
                                fit: BoxFit.cover,
                                  image: NetworkImage(banner.image.toString())),
                            );
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            bannerViewModel.banners.value.data?.length ?? 0,
                            (index) => Container(
                              width: 8.0,
                              height: 8.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    bannerViewModel.currentBanner.value == index
                                        ? Colors.white
                                        : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    title: "Categories",
                    fontSize: 18,
                    color: Colors.redAccent.shade400,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.redAccent.shade400,
                  )
                ],
              ),
            ),
            Obx(
              () => Container(
                height: Get.height * 0.25,
                padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                child: categoryViewModel.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        itemCount: categoryViewModel
                            .category.value.categories!.data!.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 80 / 90,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(CategoryWiseProductScreen(
                                category: categoryViewModel.category.value
                                    .categories!.data![index].name
                                    .toString(),
                              ));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(categoryViewModel
                                          .category
                                          .value
                                          .categories!
                                          .data![index]
                                          .image
                                          .toString()),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Text(
                                  categoryViewModel.category.value.categories!
                                      .data![index].name
                                      .toString(),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: InkWell(
                onTap: () {
                  Get.to(() => const CustomizedOrderScreen());
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade300,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(
                        title: "Customized Order",
                        fontSize: 18,
                        color: Colors.redAccent.shade400,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.redAccent.shade400,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TitleText(
                title: "Latest Product",
                fontSize: 18,
                color: Colors.redAccent.shade400,
              ),
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.all(10),
                height: Get.height * 0.335,
                child: latestViewModel.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: latestViewModel
                            .latestProduct.value.products!.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => ProductDetails(
                                  slug: latestViewModel.latestProduct.value
                                      .products!.data![index].slug!
                                      .toString(),
                                  id: latestViewModel.latestProduct.value
                                      .products!.data![index].id!
                                      .toString()));
                            },
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 8,
                                  ),
                                  height: Get.height * 0.30,
                                  width: Get.width * 0.45,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
                                        child: Image(
                                          fit: BoxFit.cover,
                                          height: Get.height * 0.19,
                                          image: NetworkImage(
                                            latestViewModel
                                                .latestProduct
                                                .value
                                                .products!
                                                .data![index]
                                                .thumbnail!
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                latestViewModel
                                                    .latestProduct
                                                    .value
                                                    .products!
                                                    .data![index]
                                                    .name
                                                    .toString(),
                                                textAlign: TextAlign.start,
                                                maxLines: 3,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.005,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  AppText(
                                                    title:
                                                        "${latestViewModel.latestProduct.value.products!.data![index].discountedPrice} Tk",
                                                    textSize: 13.0,
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  AppText(
                                                    title:
                                                        "${latestViewModel.latestProduct.value.products!.data![index].price} Tk",
                                                    textSize: 13.0,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w500,
                                                    textDecoration:
                                                        TextDecoration
                                                            .lineThrough,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.015,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    title: "Top in categories",
                    fontSize: 18,
                    color: Colors.redAccent.shade400,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.redAccent.shade400,
                  )
                ],
              ),
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.all(10),
                height: Get.height * 0.27,
                child: topInCategoriesViewModel.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: topInCategoriesViewModel
                            .topInCategoriesProduct
                            .value
                            .products!
                            .data!
                            .length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => ProductDetails(
                                  slug: topInCategoriesViewModel
                                      .topInCategoriesProduct
                                      .value
                                      .products!
                                      .data![index]
                                      .slug!
                                      .toString(),
                                  id: topInCategoriesViewModel
                                      .topInCategoriesProduct
                                      .value
                                      .products!
                                      .data![index]
                                      .id!
                                      .toString()));
                            },
                            child: Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 8,
                                  ),
                                  height: Get.height * 0.23,
                                  width: Get.width * 0.34,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15)),
                                              child: Image.network(
                                                topInCategoriesViewModel
                                                    .topInCategoriesProduct
                                                    .value
                                                    .products!
                                                    .data![index]
                                                    .thumbnail
                                                    .toString(),
                                                height: 100,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              left: 40,
                                              top: 10,
                                              child: Container(
                                                height: Get.height * 0.03,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.green),
                                                child: Center(
                                                  child: topInCategoriesViewModel
                                                              .topInCategoriesProduct
                                                              .value
                                                              .products!
                                                              .data![index]
                                                              .discount ==
                                                          null
                                                      ? const Text(
                                                          "0 %",
                                                          textAlign:
                                                              TextAlign.center,
                                                        )
                                                      : Text(
                                                          "${topInCategoriesViewModel.topInCategoriesProduct.value.products!.data![index].discount} %",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12),
                                                        ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                topInCategoriesViewModel
                                                    .topInCategoriesProduct
                                                    .value
                                                    .products!
                                                    .data![index]
                                                    .name
                                                    .toString(),
                                                textAlign: TextAlign.justify,
                                                maxLines: 3,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.005,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  AppText(
                                                    title: topInCategoriesViewModel
                                                        .topInCategoriesProduct
                                                        .value
                                                        .products!
                                                        .data![index]
                                                        .discountedPrice
                                                        .toString(),
                                                    textSize: 13.0,
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  AppText(
                                                    title: topInCategoriesViewModel
                                                        .topInCategoriesProduct
                                                        .value
                                                        .products!
                                                        .data![index]
                                                        .price
                                                        .toString(),
                                                    textSize: 13.0,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w500,
                                                    textDecoration:
                                                        TextDecoration
                                                            .lineThrough,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.015,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    title: "All Product",
                    fontSize: 18,
                    color: Colors.redAccent.shade400,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.redAccent.shade400,
                  )
                ],
              ),
            ),
            Obx(
              () => topInCategoriesViewModel.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: topInCategoriesViewModel
                              .topInCategoriesProduct
                              .value
                              .products!
                              .data!
                              .length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            mainAxisExtent: 280,
                          ),
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => ProductDetails(
                                    slug: topInCategoriesViewModel
                                        .topInCategoriesProduct
                                        .value
                                        .products!
                                        .data![index]
                                        .slug!
                                        .toString(),
                                    id: topInCategoriesViewModel
                                        .topInCategoriesProduct
                                        .value
                                        .products!
                                        .data![index]
                                        .id!
                                        .toString()));
                              },
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                color: Colors.grey.shade200,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
                                        child: Image.network(
                                          topInCategoriesViewModel
                                              .topInCategoriesProduct
                                              .value
                                              .products!
                                              .data![index]
                                              .thumbnail!
                                              .toString(),
                                          height: 10,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.015,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        topInCategoriesViewModel
                                            .topInCategoriesProduct
                                            .value
                                            .products!
                                            .data![index]
                                            .name
                                            .toString(),
                                        textAlign: TextAlign.start,
                                        maxLines: 3,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            title: topInCategoriesViewModel
                                                    .topInCategoriesProduct
                                                    .value
                                                    .products!
                                                    .data![index]
                                                    .discountedPrice +
                                                " Tk",
                                            textSize: 13.0,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          AppText(
                                            title:
                                                "${topInCategoriesViewModel.topInCategoriesProduct.value.products!.data![index].price} Tk",
                                            textSize: 13.0,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w500,
                                            textDecoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.015,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: Get.height * 0.27,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Wrap(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 8,
                  ),
                  height: Get.height * 0.23,
                  width: Get.width * 0.34,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: Image.network(
                            "https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/04/honey-1296x728-header.jpg?w=1155&h=1528",
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "Ekel Green Tea AHA BHA PHA Brightening Toner (250ml)",
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.005,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const AppText(
                                    title: "500 Tk",
                                    textSize: 13.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  AppText(
                                    title: "500 Tk",
                                    textSize: 13.0,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                    textDecoration: TextDecoration.lineThrough,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.015,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Icon(Icons.search),
          SizedBox(
            width: Get.width * 0.02,
          ),
          const Text("Search Here")
        ],
      ),
    );
  }
}
