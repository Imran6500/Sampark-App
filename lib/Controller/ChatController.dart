import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sampark/Controller/ProfileController.dart';
import 'package:sampark/Model/ChatModel.dart';
import 'package:uuid/uuid.dart';

class Chatcontroller extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  ProfileController profileController = Get.put(ProfileController());

  var uuid = const Uuid();

  String getRoomId(String targetUserId) {
    String currentUserId = auth.currentUser!.uid;

    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

  Future<void> sendMessage(String targetUserId, String message) async {
    isLoading.value = true;
    String chatId = uuid.v6();
    String roomId = getRoomId(targetUserId);
    var newChat = ChatModel(
        id: chatId,
        message: message,
        senderId: auth.currentUser!.uid,
        receiverId: targetUserId,
        senderName: profileController.currentUser.value.name);

    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(newChat.toJson());
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
