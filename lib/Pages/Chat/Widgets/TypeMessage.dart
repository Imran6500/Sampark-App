// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:sampark/Config/Image.dart';
import 'package:sampark/Controller/ImagePicker.dart';

import '../../../Controller/ChatController.dart';
import '../../../Model/UserModel.dart';

class Typemessage extends StatelessWidget {
  UserModel userModel;
  Typemessage({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    Chatcontroller chatcontroller = Get.put(Chatcontroller());
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    TextEditingController messageController = TextEditingController();
    RxString message = "".obs;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          const Icon(
            Icons.emoji_emotions_outlined,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                message.value = value;
              },
              controller: messageController,
              decoration: const InputDecoration(
                filled: false,
                hintText: "Type Message .....",
              ),
            ),
          ),
          Obx(() => chatcontroller.selectedImagePath.value == ""
              ? InkWell(
                  onTap: () async {
                    chatcontroller.selectedImagePath.value =
                        await imagePickerController.pickImageFromGallery();
                  },
                  child: SvgPicture.asset(
                    AssetsImage.chatGalarySvg,
                    width: 25,
                  ),
                )
              : const SizedBox()),
          const SizedBox(
            width: 10,
          ),
          Obx(() => message.value != "" ||
                  chatcontroller.selectedImagePath.value != ""
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    if (messageController.text.isNotEmpty ||
                        chatcontroller.selectedImagePath.value.isNotEmpty) {
                      chatcontroller.sendMessage(
                          userModel.id!, messageController.text, userModel);
                      messageController.clear();
                      message.value = "";
                    }
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: chatcontroller.isLoading.value
                        ? CircularProgressIndicator()
                        : SvgPicture.asset(
                            AssetsImage.chatSendSvg,
                          ),
                  ),
                )
              : InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {},
                  child: SvgPicture.asset(
                    AssetsImage.chatMicSvg,
                    width: 25,
                  ),
                ))
        ],
      ),
    );
  }
}
