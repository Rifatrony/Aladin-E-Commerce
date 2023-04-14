import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/view_model/product/product_details_view_model.dart';
import 'package:aladin_ecommerce/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  final String slug;
  const ProductDetails({super.key, required this.slug});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final productDetails = Get.put(ProductDetailsViewModel());

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
                          image: NetworkImage(
                              productDetails.product.value.thumbnail.toString()),
                        ),
                      ),
              
                      Text("Name: ${productDetails.product.value.name}", style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                      
                      SizedBox(height: Get.height * 0.02),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${productDetails.product.value.finalPrice}( Discount ${productDetails.product.value.discount} %)"),
                          Text(productDetails.product.value.price.toString()),
                        ],
                      ),

                      AppButton(
                        onPress: (){}, 
                        title: "Add to cart")

                    ],
                  ),
              ),
        ),
      ),
    );
  }
}
