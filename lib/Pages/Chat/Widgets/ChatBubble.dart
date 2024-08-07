// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sampark/Config/Image.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isComming;
  final String time;
  final String status;
  final String imageUrl;
  const ChatBubble({
    super.key,
    required this.message,
    required this.isComming,
    required this.time,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 15),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 1.3),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: isComming
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(10))
                    : const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(0)),
                color: Theme.of(context).colorScheme.primaryContainer),
            child: imageUrl == ""
                ? Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(imageUrl)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        message,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  )),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment:
              isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            isComming
                ? Text(
                    time,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                : Row(
                    children: [
                      Text(
                        time,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(
                        AssetsImage.chatStatusSvg,
                        height: 12,
                      ),
                    ],
                  )
          ],
        )
      ],
    );
  }
}
