import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../Config/Image.dart';
import '../HomePage/Widget/ChatTile.dart';
import 'Widgets/NewContactTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearching = false.obs;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Contact"),
        actions: [
          IconButton(
            onPressed: () {
              isSearching.value = true;
              print(isSearching.value);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Obx(
              () => isSearching.value
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
                                isSearching.value = false;
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
                  : SizedBox(),
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
            const Column(
              children: [
                ChatTile(
                  imageUrl: AssetsImage.femaleUser,
                  userName: "Imran",
                  lastChat: "Can't talk now",
                  lastTime: "08:33 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.maleUser,
                  userName: "Raja",
                  lastChat: "Let's talk",
                  lastTime: "10:33 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.femaleUser,
                  userName: "Adnan",
                  lastChat: " talk now",
                  lastTime: "09:33 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.femaleUser,
                  userName: "Alina",
                  lastChat: "Can't talk ",
                  lastTime: "08:33 PM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.femaleUser,
                  userName: "Imran",
                  lastChat: "Can't talk now",
                  lastTime: "08:33 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.maleUser,
                  userName: "Raja",
                  lastChat: "Let's talk",
                  lastTime: "10:33 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.femaleUser,
                  userName: "Adnan",
                  lastChat: " talk now",
                  lastTime: "09:33 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.femaleUser,
                  userName: "Alina",
                  lastChat: "Can't talk ",
                  lastTime: "08:33 PM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.femaleUser,
                  userName: "Imran",
                  lastChat: "Can't talk now",
                  lastTime: "08:33 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.maleUser,
                  userName: "Raja",
                  lastChat: "Let's talk",
                  lastTime: "10:33 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.femaleUser,
                  userName: "Adnan",
                  lastChat: " talk now",
                  lastTime: "09:33 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.femaleUser,
                  userName: "Alina",
                  lastChat: "Can't talk ",
                  lastTime: "08:33 PM",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
