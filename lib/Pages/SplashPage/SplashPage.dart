import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sampark/Config/Image.dart';
import 'package:sampark/Controller/SplashController.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(child: SvgPicture.asset(AssetsImage.appIconSVG)),
    );
  }
}
