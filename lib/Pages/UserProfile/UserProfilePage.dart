// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:sampark/Config/Image.dart';
import 'package:sampark/Controller/AuthController.dart';
import 'package:sampark/Model/UserModel.dart';
import 'package:sampark/Pages/UserProfile/Widgets/userInfo.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({
    Key? key,
    required this.userModel,
  }) : super(key: key);

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
            UserInfo(
              profileImage:
                  userModel.profileImage ?? AssetsImage.defaultProfileImage,
              userEmail: userModel.email ?? "",
              userName: userModel.name ?? "User",
            ),
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
