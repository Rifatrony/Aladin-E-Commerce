import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/view_model/cart/cart_view_model.dart';
import 'package:aladin_ecommerce/view_model/product/product_details_view_model.dart';
import 'package:aladin_ecommerce/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  final String slug, id;
  const ProductDetails({super.key, required this.slug, required this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final productDetails = Get.put(ProductDetailsViewModel());
  final cartViewModel = Get.put(CartViewModel());

  @override
  void initState() {
    super.initState();
    productDetails
        .getProductDetails("${AppUrl.productDetailsUrl}/${widget.slug}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Product Details",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      body: Center(
        child: Obx(
          () => productDetails.loading.value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image(image: NetworkImage(productDetails.product.value.thumbnail.toString()))
                      Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Image(
                          height: Get.height * 0.3,
                          width: Get.width,
                          fit: BoxFit.cover,
                          image: NetworkImage(productDetails
                              .product.value.thumbnail
                              .toString()),
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product Name: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.grey.shade700)),
                          Expanded(
                            child: Text(
                              productDetails.product.value.name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.deepOrange.shade400),
                            ),
                          ),
                          
                        ],
                      ),
                      SizedBox(height: Get.height * 0.01,),

                      Text(productDetails.product.value.description.toString()),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(productDetails
                                    .product.value.brand!.image
                                    .toString())),
                          ),
                          SizedBox(width: Get.width * 0.02),
                          const Text(
                            "Category:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                          SizedBox(width: Get.width * 0.02),
                          Expanded(
                            child: Text(
                              productDetails.product.value.category!.name
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Get.height * 0.02),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${productDetails.product.value.finalPrice} ৳",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            productDetails.product.value.discount == null
                                ? Text(
                                    "${"${productDetails.product.value.price} ৳"} (0 % OFF)",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )
                                : Text(
                                    "${"${productDetails.product.value.price} ৳"} (${productDetails.product.value.discount} % OFF)",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                          ],
                        ),
                      ),

                      SizedBox(height: Get.height * 0.03),

                      Obx(
                        () => AppButton(
                            loading: cartViewModel.loading.value,
                            onPress: () {
                              Map data = {
                                "quantity": "1",
                                "options": {"size": "s", "length": "m"}
                              };
                              cartViewModel.addToCart(
                                  data, "${AppUrl.addToCartUrl}/${widget.id}");
                            },
                            color: Colors.deepOrangeAccent.shade400,
                            title: "Add to cart"),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
