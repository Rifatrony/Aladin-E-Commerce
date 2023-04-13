import 'dart:async';
import 'package:aladin_ecommerce/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () { Get.offAll(const LoginScreen());});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: Get.height * 0.2,
              width: Get.height * 0.6,
              image: const AssetImage("assets/commerce.png")
            ),

            SizedBox(height: Get.height * 0.1),

            const CircularProgressIndicator()
          ],
        )
      )
    );
  }
}