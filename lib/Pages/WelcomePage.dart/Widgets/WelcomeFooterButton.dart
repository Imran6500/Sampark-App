import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sampark/Config/Image.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../Config/Strings.dart';

class WelcomeFooterButton extends StatelessWidget {
  const WelcomeFooterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: () {
        Get.offAllNamed("/authPage");
      },
      innerColor: Theme.of(context).colorScheme.primary,
      outerColor: Theme.of(context).colorScheme.primaryContainer,
      submittedIcon: SvgPicture.asset(AssetsImage.connectSVG),
      sliderButtonIcon: Container(
        height: 25,
        width: 25,
        child: SvgPicture.asset(
          AssetsImage.plugSVG,
          width: 30,
        ),
      ),
      text: WelcomePageString.slideToStart,
      textStyle: Theme.of(context).textTheme.labelLarge,
    );
  }
}
