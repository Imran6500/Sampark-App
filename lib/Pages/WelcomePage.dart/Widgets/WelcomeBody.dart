import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sampark/Config/Image.dart';

import '../../../Config/Strings.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsImage.maleUser),
            SvgPicture.asset(AssetsImage.connectSVG),
            Image.asset(AssetsImage.femaleUser),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          WelcomePageString.nowYouAre,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          WelcomePageString.connected,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          WelcomePageString.discription,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        )
      ],
    );
  }
}
