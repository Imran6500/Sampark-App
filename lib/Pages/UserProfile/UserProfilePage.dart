import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sampark/Config/Image.dart';
import 'package:sampark/Controller/AuthController.dart';
import 'package:sampark/Pages/UserProfile/Widgets/userInfo.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("/updateProfile");
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const UserInfo(),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  authController.Logout();
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
