import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:sampark/Config/Image.dart';
import 'package:sampark/Config/Strings.dart';
import 'package:sampark/Controller/ContactController.dart';
import 'package:sampark/Controller/ImagePicker.dart';
import 'package:sampark/Controller/ProfileController.dart';
import 'package:sampark/Pages/HomePage/Widget/ChatList.dart';
import 'package:sampark/Pages/HomePage/Widget/TabBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    ProfileController profileController = Get.put(ProfileController());

    ContactController contactController = Get.put(ContactController());

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              AssetsImage.appIconSVG,
            ),
          ),
          title: Text(AppString.appName,
              style: Theme.of(context).textTheme.headlineSmall),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                contactController.getChatRoomList();
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () async {
                await profileController.getUserDetails();
                Get.toNamed("/profilePage");
              },
            ),
          ],
          bottom: myTabBar(tabController, context)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          children: const [
            ChatList(),
            ChatList(),
            ChatList(),
          ],
        ),
      ),
    );
  }
}
