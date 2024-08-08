// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../Controller/ImagePicker.dart';
import '../../../Controller/ProfileController.dart';
import '../../Auth/Widget/PrimaryButton.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({
    super.key,
    required this.isEdit,
    required this.imagePath,
    required this.imagePickerController,
    required this.profileController,
    required this.nameController,
    required this.aboutController,
    required this.emailController,
    required this.phoneNumberController,
  });

  final RxBool isEdit;
  final RxString imagePath;
  final ImagePickerController imagePickerController;
  final ProfileController profileController;
  final TextEditingController nameController;
  final TextEditingController aboutController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primaryContainer),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Obx(() => isEdit.value
                        ? InkWell(
                            onTap: () async {
                              imagePath.value = await imagePickerController
                                  .pickImageFromGallery();
                            },
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(100)),
                              child: imagePath.value.isEmpty
                                  ? const Icon(Icons.add)
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        File(imagePath.value),
                                        fit: BoxFit.cover,
                                      )),
                            ))
                        : Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(100)),
                            child: profileController
                                            .currentUser.value.profileImage ==
                                        null ||
                                    profileController
                                            .currentUser.value.profileImage ==
                                        ""
                                ? const Icon(Icons.image)
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      profileController
                                          .currentUser.value.profileImage!,
                                      fit: BoxFit.cover,
                                    )),
                          )),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => TextField(
                        enabled: isEdit.value,
                        controller: nameController,
                        decoration: InputDecoration(
                          filled: isEdit.value,
                          prefixIcon: const Icon(
                            Icons.person,
                          ),
                          labelText: "Name",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => TextField(
                        controller: aboutController,
                        enabled: isEdit.value,
                        decoration: InputDecoration(
                          filled: isEdit.value,
                          prefixIcon: const Icon(
                            Icons.info_rounded,
                          ),
                          labelText: "About",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      enabled: false,
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: isEdit.value,
                        prefixIcon: const Icon(
                          Icons.alternate_email,
                        ),
                        labelText: "Email",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => TextField(
                        enabled: isEdit.value,
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          filled: isEdit.value,
                          prefixIcon: const Icon(
                            Icons.phone,
                          ),
                          labelText: "Number",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => profileController.isLoading.value
                              ? const CircularProgressIndicator()
                              : isEdit.value
                                  ? PrimaryButton(
                                      ontap: () async {
                                        await profileController.updateProfile(
                                            imagePath.value,
                                            nameController.text,
                                            aboutController.text,
                                            phoneNumberController.text);

                                        isEdit.value = false;
                                      },
                                      btnName: "Save",
                                      icon: Icons.save)
                                  : PrimaryButton(
                                      ontap: () {
                                        isEdit.value = true;
                                      },
                                      btnName: "Edit",
                                      icon: Icons.edit),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
