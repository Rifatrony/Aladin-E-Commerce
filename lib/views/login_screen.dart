import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:aladin_ecommerce/view_model/auth/login_view_model.dart';
import 'package:aladin_ecommerce/views/sign_up_screen.dart';
import 'package:aladin_ecommerce/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginViewModel = Get.put(LoginViewModel());

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
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            const Text(
              "Welcome back\n\nLogin Here",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            TextFormField(
              controller: loginViewModel.phoneController.value,
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
            ),
            SizedBox(height: Get.height * 0.02),
            TextFormField(
              controller: loginViewModel.passwordController.value,
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
            AppButton(
                onPress: () {
                  if (loginViewModel.phoneController.value.text.isEmpty) {
                    Utils.snackBar("Phone Number Required",
                        "Please enter your phone number");
                  } else if (loginViewModel
                      .passwordController.value.text.isEmpty) {
                    Utils.snackBar(
                        "Password Required", "Please enter your password");
                  } else if (loginViewModel
                          .passwordController.value.text.length <
                      6) {
                    Utils.snackBar(
                        "Password Number Required", "Minimum password is 6");
                  } else {
                    Map data = {
                      'phone': loginViewModel.phoneController.value.text.trim(),
                      'password':
                          loginViewModel.passwordController.value.text.trim()
                    };
                    loginViewModel.loginApi(data);
                  }
                },
                title: "Login"),
            SizedBox(height: Get.height * 0.05),
            InkWell(
              onTap: () {
                Get.to(() => const SignUpScreen());
              },
              child: RichText(
                text: const TextSpan(
                  text: 'No account yet? ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
