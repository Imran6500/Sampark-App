import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sampark/Model/UserModel.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  final db = FirebaseFirestore.instance;

  //login
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed("/homePage");
      print("Logged in Successully🍻");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

//create user
  Future<void> createUser(String email, String password, String name) async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //storing the new created user into firestore
      await initUser(email, name);
      Get.toNamed("/homePage");
      print("Acount Created! 🍻");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

//logout
  Future<void> Logout() async {
    await auth.signOut();
    Get.toNamed("/authPage");
  }

  //add user to db
  Future<void> initUser(String email, String name) async {
    var newUser =
        UserModel(email: email, name: name, id: auth.currentUser!.uid);
    try {
      await db
          .collection('users')
          .doc(auth.currentUser!.uid)
          .set(newUser.toJson());
    } catch (e) {
      print(e);
    }
  }
}
