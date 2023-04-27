import 'package:aladin_ecommerce/view_model/accounts/profile_view_model.dart';
import 'package:aladin_ecommerce/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderProceedScreen extends StatefulWidget {
  const OrderProceedScreen({super.key});

  @override
  State<OrderProceedScreen> createState() => _OrderProceedScreenState();
}

class _OrderProceedScreenState extends State<OrderProceedScreen> {
  final profileViewModel = Get.put(ProfileViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => profileViewModel.loading.value
            ? const CircularProgressIndicator()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                              height: Get.height * 0.005,
                            ),
                            profileViewModel.user.value.user!.address == null
                            ? TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Write Your Address",
                                labelText: "Write Your Address",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)
                                )
                              ),
                            )
                            : AppText(
                              title: profileViewModel.user.value.user!.address
                                  .toString(),
                              color: Colors.black,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
      ),
    );
  }
}
