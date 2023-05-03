import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:aladin_ecommerce/view_model/accounts/profile_view_model.dart';
import 'package:aladin_ecommerce/view_model/auth/user_preference.dart';
import 'package:aladin_ecommerce/views/login_screen.dart';
import 'package:aladin_ecommerce/views/oder_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileViewModel = Get.put(ProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent.shade400,
        elevation: 0,
        title: const Text(
          "Profile",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile section Container
            Container(
              height: Get.height * 0.15,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent.shade400,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36))),
              child: Obx(
                () => profileViewModel.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                radius: 36,
                                backgroundImage: NetworkImage(
                                    "https://www.kindpng.com/picc/m/24-248729_stockvader-predicted-adig-user-profile-image-png-transparent.png"),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.02,
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    profileViewModel.user.value.user!.name
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.005,
                                  ),
                                  Text(
                                    profileViewModel.user.value.user!.phone
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.003,
                                  ),
                                  profileViewModel.user.value.user!.email ==
                                          null
                                      ? const Text(
                                          "Update your email",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      : Text(
                                          profileViewModel
                                              .user.value.user!.email
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                  SizedBox(
                                    height: Get.height * 0.005,
                                  ),
                                  profileViewModel.user.value.user!.address ==
                                          null
                                      ? const Text(
                                          "Update your Address",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11),
                                        )
                                      : Text(
                                          profileViewModel
                                              .user.value.user!.address
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11),
                                        )
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                        title: "Update Profile",
                                        titlePadding:
                                            const EdgeInsets.only(top: 20),
                                        backgroundColor: Colors.grey.shade200,
                                        titleStyle: const TextStyle(
                                            color: Colors.black),
                                        content: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: [
                                                // TextFormField(
                                                //   initialValue: profileViewModel.user.value.user!.name,
                                                //   decoration: InputDecoration(
                                                //     focusedBorder: OutlineInputBorder(
                                                //       borderRadius: BorderRadius.circular(16),
                                                //     ),
                                                //     enabledBorder: OutlineInputBorder(
                                                //       borderRadius: BorderRadius.circular(16)
                                                //     ),
                                                //     labelText: "Name",
                                                //     isDense: true
                                                //   ),
                                                // ),

                                                SizedBox(
                                                  height: Get.height * 0.015,
                                                ),

                                                TextFormField(
                                                  controller: profileViewModel
                                                      .phoneController.value,
                                                  decoration: InputDecoration(
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                      labelText: "Phone",
                                                      isDense: true),
                                                  // onFieldSubmitted: (value) {
                                                  //   Utils.fieldFocusChange(context, profileViewModel.phoneFocusNode.value, profileViewModel.emailFocusNode.value);
                                                  // },
                                                ),

                                                SizedBox(
                                                  height: Get.height * 0.015,
                                                ),

                                                TextFormField(
                                                  controller: profileViewModel
                                                      .emailController.value,
                                                  decoration: InputDecoration(
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                      labelText: "Email",
                                                      isDense: true),
                                                  // onFieldSubmitted: (value) {
                                                  //   Utils.fieldFocusChange(context, profileViewModel.emailFocusNode.value, profileViewModel.addressFocusNode.value);
                                                  // },
                                                ),

                                                SizedBox(
                                                  height: Get.height * 0.015,
                                                ),

                                                TextFormField(
                                                  controller: profileViewModel
                                                      .addressController.value,
                                                  maxLines: 3,
                                                  decoration: InputDecoration(
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                      labelText: "Address",
                                                      isDense: true),
                                                ),

                                                SizedBox(
                                                  height: Get.height * 0.015,
                                                ),

                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: const Text(
                                                            "Cancel")),
                                                    TextButton(
                                                        onPressed: () {
                                                          if (profileViewModel
                                                              .phoneController
                                                              .value
                                                              .text
                                                              .isEmpty) {
                                                            Utils.snackBar(
                                                                "Number Required",
                                                                "Enter Your Number");
                                                          } else if (profileViewModel
                                                              .emailController
                                                              .value
                                                              .text
                                                              .isEmpty) {
                                                            Utils.snackBar(
                                                                "Email Required",
                                                                "Enter Your Email");
                                                          } else if (profileViewModel
                                                              .addressController
                                                              .value
                                                              .text
                                                              .isEmpty) {
                                                            Utils.snackBar(
                                                                "Address Required",
                                                                "Enter Your Address");
                                                          } else {
                                                            Map data = {
                                                              "name":
                                                                  profileViewModel
                                                                      .user
                                                                      .value
                                                                      .user!
                                                                      .name,
                                                              "email": profileViewModel
                                                                  .emailController
                                                                  .value
                                                                  .text
                                                                  .toString(),
                                                              "phone": profileViewModel
                                                                  .phoneController
                                                                  .value
                                                                  .text
                                                                  .toString(),
                                                              "address":
                                                                  profileViewModel
                                                                      .addressController
                                                                      .value
                                                                      .text
                                                                      .toString(),
                                                            };
                                                            profileViewModel
                                                                .updateProfile(
                                                                    data);
                                                            Get.back();
                                                          }
                                                        },
                                                        child: const Text(
                                                            "Update")),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.edit_outlined,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Update\nprofile",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.747,
              width: Get.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Get.to(const OrderScreen());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 20, right: 8),
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey.shade200),
                              child: const Center(child: Text("Order")),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              // Get.to(const OrderScreen());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8, right: 20),
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey.shade200),
                              child:
                                  const Center(child: Text("Account Details")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              // Get.to(const OrderScreen());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 20, right: 8),
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey.shade200),
                              child:
                                  const Center(child: Text("Change Password")),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              UserPrefernce().removeUser();
                              Get.offAll(const LoginScreen());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8, right: 20),
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey.shade200),
                              child: const Center(child: Text("Logout")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
