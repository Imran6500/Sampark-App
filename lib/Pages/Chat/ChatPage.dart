import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sampark/Pages/Chat/Widgets/ChatBubble.dart';
import '../../Config/Image.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
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
                  "Imran Hashmi",
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
            const Expanded(
                child: TextField(
              decoration: InputDecoration(
                  filled: false, hintText: "Type Message ....."),
            )),
            SvgPicture.asset(
              AssetsImage.chatGalarySvg,
              width: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: SvgPicture.asset(
                AssetsImage.chatSendSvg,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: const [
            ChatBubble(
                message: "Hii how are you?",
                isComming: true,
                time: "09:10 AM",
                status: "read",
                imageUrl:
                    "https://i.ytimg.com/vi/RaqPIoJSTtI/maxresdefault.jpg"),
            ChatBubble(
                message: "Hii how are you?",
                isComming: true,
                time: "09:10 AM",
                status: "read",
                imageUrl: ""),
            ChatBubble(
                message: "Hii how are you?",
                isComming: false,
                time: "09:10 AM",
                status: "read",
                imageUrl:
                    "https://i.ytimg.com/vi/RaqPIoJSTtI/maxresdefault.jpg")
          ],
        ),
      ),
    );
  }
}
