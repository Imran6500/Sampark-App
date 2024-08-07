import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/Pages/Auth/Widget/PrimaryButton.dart';

import '../../../Controller/AuthController.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();

    TextEditingController emailController = TextEditingController();

    TextEditingController passwordController = TextEditingController();

    AuthController authController = Get.put(AuthController());

    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: fullNameController,
          decoration: const InputDecoration(
              hintText: "Full Name", prefixIcon: Icon(Icons.person)),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.alternate_email_rounded)),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
              hintText: "Password", prefixIcon: Icon(Icons.password_outlined)),
        ),
        const SizedBox(
          height: 50,
        ),
        Obx(() => authController.isLoading.value
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    btnName: "Signup",
                    icon: Icons.lock_open_rounded,
                    ontap: () {
                      authController.createUser(emailController.text,
                          passwordController.text, fullNameController.text);
                    },
                  ),
                ],
              ))
      ],
    );
  }
}
