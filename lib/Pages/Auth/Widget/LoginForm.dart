import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/Controller/AuthController.dart';
import 'package:sampark/Pages/Auth/Widget/PrimaryButton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    TextEditingController passwordController = TextEditingController();

    AuthController authController = Get.put(AuthController());

    return Column(
      children: [
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
                    btnName: "LOGIN",
                    icon: Icons.lock_open_rounded,
                    ontap: () {
                      authController.login(
                          emailController.text, passwordController.text);
                    },
                  ),
                ],
              ))
      ],
    );
  }
}
