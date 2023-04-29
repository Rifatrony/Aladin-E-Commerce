import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/view_model/category/category_view_model.dart';
import 'package:aladin_ecommerce/views/product_details_screen.dart';
import 'package:aladin_ecommerce/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWiseProductScreen extends StatefulWidget {
  final String category;
  const CategoryWiseProductScreen({super.key, required this.category});

  @override
  State<CategoryWiseProductScreen> createState() =>
      _CategoryWiseProductScreenState();
}

class _CategoryWiseProductScreenState extends State<CategoryWiseProductScreen> {
  final categoryViewModel = Get.put(CategoryViewModel());

  @override
  void initState() {
    super.initState();
    categoryViewModel.getCategoryWiseProduct(
        AppUrl.categoryWiseProductUrl + widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        title: Text(widget.category),
      ),
      body: Obx(() => categoryViewModel.categoryLoading.value
          ? const Center(child: CircularProgressIndicator())
          : categoryViewModel
                  .categoryWiseProduct.value.products!.data!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: categoryViewModel
                          .categoryWiseProduct.value.products!.data!.length,
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
                                slug: categoryViewModel.categoryWiseProduct
                                    .value.products!.data![index].slug!
                                    .toString(),
                                id: categoryViewModel.categoryWiseProduct.value
                                    .products!.data![index].id!
                                    .toString()));
                          },
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            color: Colors.grey.shade200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    child: Image.network(
                                      categoryViewModel
                                          .categoryWiseProduct
                                          .value
                                          .products!
                                          .data![index]
                                          .thumbnail!
                                          .toString(),
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.015,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    categoryViewModel.categoryWiseProduct.value
                                        .products!.data![index].name
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
                                        title:
                                            "${categoryViewModel.categoryWiseProduct.value.products!.data![index].discountedPrice} Tk",
                                        textSize: 13.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      AppText(
                                        title:
                                            "${categoryViewModel.categoryWiseProduct.value.products!.data![index].price} Tk",
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
                )
              : Center(
                  child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Nothing found for category ',
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      children: [
                        TextSpan(
                          text: widget.category,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.redAccent.shade400),
                        ),
                      ],
                    ),
                  ),
                ))),
    );
  }
}
