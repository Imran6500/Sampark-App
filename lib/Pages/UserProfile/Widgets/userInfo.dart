import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sampark/Controller/ProfileController.dart';

import '../../../Config/Image.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(AssetsImage.maleUser)],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      profileController.currentUser.value.name ?? "User",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      profileController.currentUser.value.email ?? "Email Id",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.surface),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AssetsImage.audioCallSVG,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Call",
                          style: TextStyle(color: Color(0xff039C00)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.surface),
                    child: Row(
                      children: [
                        Icon(
                          Icons.video_call,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Video",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.surface),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AssetsImage.appIconSVG,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("Chat",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
