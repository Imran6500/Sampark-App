import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/Config/Image.dart';
import 'package:sampark/Controller/ContactController.dart';
import 'package:sampark/Controller/ProfileController.dart';
import 'package:sampark/Pages/Chat/ChatPage.dart';

import 'ChatTile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    ProfileController profileController = Get.put(ProfileController());
    return RefreshIndicator(
        child: Obx(() => ListView(
            children: contactController.chatRoomList
                .map(
                  (e) => InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.to(
                        ChatPage(
                          userModel: (e.receiver!.id ==
                                  profileController.currentUser.value.id
                              ? e.sender
                              : e.receiver)!,
                        ),
                      );
                    },
                    child: ChatTile(
                      imageUrl: (e.receiver!.id ==
                                  profileController.currentUser.value.id
                              ? e.sender!.profileImage
                              : e.receiver!.profileImage) ??
                          AssetsImage.defaultProfileImage,
                      userName: (e.receiver!.id ==
                                  profileController.currentUser.value.id
                              ? e.sender!.name
                              : e.receiver!.name) ??
                          "User",
                      lastChat: e.lastMessage ?? "Let's talk",
                      lastTime: e.lastMessageTimestamp ?? "10:33 AM",
                    ),
                  ),
                )
                .toList())),
        onRefresh: () {
          return contactController.getChatRoomList();
        });
  }
}
