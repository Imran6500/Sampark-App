import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sampark/Config/Image.dart';
import 'package:sampark/Config/Strings.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsImage.appIconSVG,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(AppString.appName,
            style: Theme.of(context).textTheme.headlineLarge),
      ],
    );
  }
}
