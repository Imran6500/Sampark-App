import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:sampark/Controller/AuthController.dart';
import 'package:sampark/Model/UserModel.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final store = FirebaseStorage.instance;
  RxBool isLoading = false.obs;

  Rx<UserModel> currentUser = UserModel().obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails() async {
    await db.collection("users").doc(auth.currentUser!.uid).get().then(
          (value) => {
            currentUser.value = UserModel.fromJson(
              value.data()!,
            ),
          },
        );
  }

  Future<void> updateProfile(
    String? imageUrl,
    String? name,
    String? about,
    String? number,
  ) async {
    isLoading.value = true;
    try {
      final imageLink = await uploadFileToFirebase(imageUrl!);

      final updatedUser = UserModel(
        name: name,
        about: about,
        id: auth.currentUser!.uid,
        email: auth.currentUser!.email,
        profileImage:
            imageUrl.isEmpty ? currentUser.value.profileImage : imageLink,
        phoneNumber: number,
      );

      await db.collection("users").doc(auth.currentUser!.uid).set(
            updatedUser.toJson(),
          );
      await getUserDetails();
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<String> uploadFileToFirebase(String imagePath) async {
    final path = "files/$imagePath";
    final file = File(imagePath);

    if (imagePath != "") {
      try {
        final ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadImageUrl = await uploadTask.ref.getDownloadURL();
        print(downloadImageUrl);
        return downloadImageUrl;
      } catch (e) {
        print(e);
        return "";
      }
    }
    return "";
  }
}
