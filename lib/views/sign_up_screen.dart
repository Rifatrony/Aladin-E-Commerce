import 'package:aladin_ecommerce/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              "Create new Account",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            TextFormField(
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

            SizedBox(height: Get.height * 0.05),

            InkWell(
              onTap: () {
                Get.to(()=>const LoginScreen());
              },
              child: RichText(
                text: const TextSpan(
                  text: 'Already have account? ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 46, 16, 16), fontSize: 16
                  ),
                  children: [
                    TextSpan(
                      text: 'Login',
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