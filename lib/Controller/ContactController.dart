import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sampark/Model/ChatRoomModel.dart';
import 'package:sampark/Model/UserModel.dart';

class ContactController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<ChatRoomModel> chatRoomList = <ChatRoomModel>[].obs;

  void onInit() async {
    super.onInit();
    await getUserList();
    await getChatRoomList();
  }

  Future<void> getUserList() async {
    isLoading.value = true;
    try {
      userList.clear();
      await db.collection("users").get().then(
            (value) => {
              userList.value = value.docs
                  .map(
                    (e) => UserModel.fromJson(
                      e.data(),
                    ),
                  )
                  .toList()
            },
          );
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> getChatRoomList() async {
    List<ChatRoomModel> tempchatRoomtList = [];
    await db.collection("chats").get().then((value) {
      tempchatRoomtList = value.docs
          .map(
            (e) => ChatRoomModel.fromJson(e.data()),
          )
          .toList();
    });
    chatRoomList.value = tempchatRoomtList
        .where(
          (e) => e.id!.contains(
            auth.currentUser!.uid,
          ),
        )
        .toList();
  }
}
