import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sampark/Controller/ChatController.dart';
import 'package:sampark/Controller/ContactController.dart';
import 'package:sampark/Controller/ProfileController.dart';
import 'package:sampark/Pages/Chat/ChatPage.dart';

import '../../Config/Image.dart';
import '../HomePage/Widget/ChatTile.dart';
import 'Widgets/NewContactTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;

    ContactController contactController = Get.put(ContactController());

    Chatcontroller chatController = Get.put(Chatcontroller());

    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Contact"),
        actions: [
          Obx(() => isSearchEnable.value
              ? IconButton(
                  onPressed: () {
                    isSearchEnable.value = false;
                  },
                  icon: const Icon(Icons.close),
                )
              : IconButton(
                  onPressed: () {
                    isSearchEnable.value = true;
                  },
                  icon: const Icon(Icons.search),
                ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Obx(
              () => isSearchEnable.value
                  ? Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) {
                                print(value);
                                isSearchEnable.value = false;
                              },
                              decoration: const InputDecoration(
                                hintText: "Search Contact",
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(height: 10),
            NewContactTile(
              btnName: "Add Contact",
              icon: Icons.person_add,
              ontap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            NewContactTile(
              btnName: "New Group",
              icon: Icons.group_add,
              ontap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text("Contacts on Sampark"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => Column(
                  children: contactController.userList
                      .map(
                        (e) => InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            // Get.toNamed("/chatPage");
                            Get.to(() => ChatPage(userModel: e));
                          },
                          child: ChatTile(
                            imageUrl: e.profileImage ??
                                AssetsImage.defaultProfileImage,
                            userName: e.name ?? "User",
                            lastChat: e.about ?? "Hey there!",
                            lastTime: e.email ==
                                    profileController.currentUser.value.email
                                ? "You"
                                : "",
                          ),
                        ),
                      )
                      .toList(),
                ))
          ],
        ),
      ),
    );
  }
}
