import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/view_model/accounts/profile_view_model.dart';
import 'package:aladin_ecommerce/view_model/checkout/custom_order_view_model.dart';
import 'package:aladin_ecommerce/widgets/app_button.dart';
import 'package:aladin_ecommerce/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOrderProceedScreen extends StatefulWidget {
  final String product;
  const CustomOrderProceedScreen({super.key, required this.product});

  @override
  State<CustomOrderProceedScreen> createState() =>
      _CustomOrderProceedScreenState();
}

class _CustomOrderProceedScreenState extends State<CustomOrderProceedScreen> {
  final profileViewModel = Get.put(ProfileViewModel());
  final customOrderViewModel = Get.put(CustomOrderViewModel());
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        title: const Text("Place Order"),
      ),
      body: Obx(
        () => profileViewModel.loading.value
            ? const CircularProgressIndicator()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: "Name",
                                color: Colors.grey.shade800,
                              ),
                              SizedBox(
                                height: Get.height * 0.005,
                              ),
                              AppText(
                                title: profileViewModel.user.value.user!.name
                                    .toString(),
                                color: Colors.black,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: "Phone",
                                color: Colors.grey.shade800,
                              ),
                              SizedBox(
                                height: Get.height * 0.005,
                              ),
                              AppText(
                                title: profileViewModel.user.value.user!.phone
                                    .toString(),
                                color: Colors.black,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: "Email",
                                color: Colors.grey.shade800,
                              ),
                              SizedBox(
                                height: Get.height * 0.005,
                              ),
                              AppText(
                                title: profileViewModel.user.value.user!.email
                                    .toString(),
                                color: Colors.black,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: "Address",
                                color: Colors.grey.shade800,
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              profileViewModel.user.value.user!.address == null
                                  ? TextFormField(
                                    controller: addressController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: "Write Your Address",
                                          labelText: "Write Your Address",
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16))),
                                    )
                                  : AppText(
                                      title: profileViewModel
                                          .user.value.user!.address
                                          .toString(),
                                      color: Colors.black,
                                    ),
                            ],
                          )),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: "Your Order",
                                color: Colors.grey.shade800,
                              ),
                              SizedBox(
                                height: Get.height * 0.005,
                              ),
                              AppText(
                                title: widget.product,
                                color: Colors.black,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),

                      AppButton(
                        loading: customOrderViewModel.loading.value,
                        onPress: (){
                          Map data = {
                            "name": profileViewModel.user.value.user!.name.toString(),
                            "email": profileViewModel.user.value.user!.email.toString(),
                            "phone": profileViewModel.user.value.user!.phone.toString(),
                            "shipping_address": profileViewModel.user.value.user!.address ?? addressController.text.toString(),
                            "product": widget.product
                          };
                          customOrderViewModel.createCustomOrder(data, AppUrl.customOrderUrl);
                        }, title: "Place Order", height: 50, color: Colors.deepOrangeAccent,)
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
