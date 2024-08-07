import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampark/Config/Image.dart';

import 'ChatTile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
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
    );
  }
}
