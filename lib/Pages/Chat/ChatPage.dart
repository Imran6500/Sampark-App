import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:sampark/Controller/ChatController.dart';
import 'package:sampark/Controller/ProfileController.dart';
import 'package:sampark/Pages/Chat/Widgets/ChatBubble.dart';

import '../../Config/Image.dart';
import '../../Model/UserModel.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({
    super.key,
    required this.userModel,
  });
  @override
  Widget build(BuildContext context) {
    Chatcontroller chatcontroller = Get.put(Chatcontroller());
    TextEditingController messageController = TextEditingController();

    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AssetsImage.maleUser,
              height: 40,
              width: 40,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Row(
          children: [
            SvgPicture.asset(
              AssetsImage.chatMicSvg,
              width: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  filled: false,
                  hintText: "Type Message .....",
                ),
              ),
            ),
            SvgPicture.asset(
              AssetsImage.chatGalarySvg,
              width: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                if (messageController.text.isNotEmpty) {
                  chatcontroller.sendMessage(
                      userModel.id!, messageController.text);
                  messageController.clear();
                }
              },
              child: SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset(
                  AssetsImage.chatSendSvg,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
          padding:
              const EdgeInsets.only(bottom: 75, left: 10, top: 10, right: 10),
          child: StreamBuilder(
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
                        DateTime timestamp =
                            DateTime.parse(snapshot.data![index].timestamp!);
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
              })),
    );
  }
}
