import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/Controller/AuthController.dart';
import 'package:sampark/Controller/ImagePicker.dart';
import 'package:sampark/Controller/ProfileController.dart';
import 'Widgets/ProfilePageBody.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    //to make user info editable
    RxBool isEdit = false.obs;
    RxString imagePath = "".obs;

    ProfileController profileController = Get.put(ProfileController());
    AuthController authController = Get.put(AuthController());

    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    TextEditingController nameController = TextEditingController(
        text: profileController.currentUser.value.name ?? "User");
    TextEditingController emailController = TextEditingController(
        text: profileController.currentUser.value.email ?? "Email");
    TextEditingController phoneNumberController = TextEditingController(
        text: profileController.currentUser.value.phoneNumber ??
            "Contact Number");
    TextEditingController aboutController = TextEditingController(
        text: profileController.currentUser.value.about ??
            "Write Something About You!");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                authController.Logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ProfilePageBody(
            isEdit: isEdit,
            imagePath: imagePath,
            imagePickerController: imagePickerController,
            profileController: profileController,
            nameController: nameController,
            aboutController: aboutController,
            emailController: emailController,
            phoneNumberController: phoneNumberController),
      ),
    );
  }
}
