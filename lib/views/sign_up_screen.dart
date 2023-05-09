import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:aladin_ecommerce/view_model/auth/sign_up_view_model.dart';
import 'package:aladin_ecommerce/views/login_screen.dart';
import 'package:aladin_ecommerce/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final controller = Get.put(SignUpViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.1,
              ),
              const Text(
                "Create new Account",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              TextFormField(
                controller: controller.nameController.value,
                focusNode: controller.nameFocusNode.value,
                keyboardType: TextInputType.text,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    fillColor: Colors.grey[100], // set your desired color here
                    labelText: 'Name',
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36.0),
                        borderSide: BorderSide.none),
                    prefixIcon: const Icon(Icons.person_outline)),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, controller.nameFocusNode.value,
                      controller.emailFocusNode.value);
                },
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              TextFormField(
                controller: controller.emailController.value,
                focusNode: controller.emailFocusNode.value,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    fillColor: Colors.grey[100], // set your desired color here
                    labelText: 'Email',
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36.0),
                        borderSide: BorderSide.none),
                    prefixIcon: const Icon(Icons.email_outlined)),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, controller.emailFocusNode.value,
                      controller.phoneFocusNode.value);
                },
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              TextFormField(
                controller: controller.phoneController.value,
                focusNode: controller.phoneFocusNode.value,
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    fillColor: Colors.grey[100], // set your desired color here
                    labelText: 'Phone',
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36.0),
                        borderSide: BorderSide.none),
                    prefixIcon: const Icon(Icons.phone_outlined)),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, controller.phoneFocusNode.value,
                      controller.passwordFocusNode.value);
                },
              ),
              SizedBox(height: Get.height * 0.02),
              TextFormField(
                controller: controller.passwordController.value,
                focusNode: controller.passwordFocusNode.value,
                obscureText: true,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    fillColor: Colors.grey[100], // set your desired color here
                    labelText: 'Password',
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36.0),
                        borderSide: BorderSide.none),
                    prefixIcon: const Icon(Icons.lock_outline)),
              ),
              SizedBox(height: Get.height * 0.03),
              Obx(
                () => AppButton(
                    loading: controller.loading.value,
                    onPress: () {
                      if (controller.nameController.value.text.isEmpty) {
                        Utils.snackBar("Name Required", "Please enter your name");
                      } else if (controller.emailController.value.text.isEmpty) {
                        Utils.snackBar(
                            "Email Required", "Please enter your email");
                      } else if (controller.phoneController.value.text.isEmpty) {
                        Utils.snackBar("Phone Number Required",
                            "Please enter your phone number");
                      } else if (controller
                          .passwordController.value.text.isEmpty) {
                        Utils.snackBar(
                            "Password Required", "Please enter your password");
                      } else if (controller.passwordController.value.text.length <
                          8) {
                        Utils.snackBar(
                            "Password Number Required", "Minimum password is 6");
                      } else {
                        Map data = {
                          'name': controller.nameController.value.text.trim(),
                          'email': controller.emailController.value.text.trim(),
                          'phone': controller.phoneController.value.text.trim(),
                          'password':
                              controller.passwordController.value.text.trim(),
                          'password_confirmation':
                              controller.passwordController.value.text.trim(),
                          'device_name': 'redmi',
                        };
                        controller.signUpApi(data);
                      }
                    },
                    title: "Sign Up", color: Colors.deepOrangeAccent.shade400,),
              ),
              SizedBox(height: Get.height * 0.05),
              InkWell(
                onTap: () {
                  Get.offAll(() => const LoginScreen());
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have account? ',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 46, 16, 16), fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Login here',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent.shade400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
