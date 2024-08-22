import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sampark/Controller/ChatController.dart';
import 'package:sampark/Controller/ProfileController.dart';
import 'package:sampark/Pages/Chat/Widgets/TypeMessage.dart';
import 'package:sampark/Pages/UserProfile/UserProfilePage.dart';
import '../../Model/UserModel.dart';
import 'Widgets/ChatBubble.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({
    super.key,
    required this.userModel,
  });
  @override
  Widget build(BuildContext context) {
    Chatcontroller chatcontroller = Get.put(Chatcontroller());
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(UserProfilePage(userModel: userModel));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 45,
                width: 45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: profileController.currentUser.value.profileImage!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name ?? "User",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Online",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 10, left: 10, top: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: Stack(children: [
                StreamBuilder(
                  stream: chatcontroller.getMessages(userModel.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text("No Message"),
                      );
                    } else {
                      return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            DateTime timestamp = DateTime.parse(
                                snapshot.data![index].timestamp!);
                            String formattedTime =
                                DateFormat('hh:mm a').format(timestamp);
                            return ChatBubble(
                              message:
                                  snapshot.data![index].message ?? "Hiii there",
                              isComming: snapshot.data![index].receiverId ==
                                  profileController.currentUser.value.id,
                              time: formattedTime,
                              status: "read",
                              imageUrl: snapshot.data![index].imageUrl ?? "",
                            );
                          });
                    }
                  },
                ),
                Obx(() => chatcontroller.selectedImagePath.value != ""
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(
                                      File(chatcontroller
                                          .selectedImagePath.value),
                                    ),
                                    fit: BoxFit.contain),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(15)),
                            height: 500,
                          ),
                          Positioned(
                              right: 0,
                              child: IconButton(
                                  onPressed: () {
                                    chatcontroller.selectedImagePath.value = "";
                                  },
                                  icon: const Icon(Icons.close)))
                        ]),
                      )
                    : Container()),
              ]),
            ),
            Typemessage(userModel: userModel),
          ],
        ),
      ),
    );
  }
}
