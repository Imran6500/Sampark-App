import 'package:get/get.dart';
import 'package:sampark/Pages/Auth/AuthPage.dart';
import 'package:sampark/Pages/Chat/ChatPage.dart';
import 'package:sampark/Pages/ContactPage/ContactPage.dart';
import 'package:sampark/Pages/HomePage/HomePage.dart';
import 'package:sampark/Pages/Profile/ProfilePage.dart';
import 'package:sampark/Pages/UserProfile/UserProfilePage.dart';

import '../Pages/UserProfile/UpdateProfile.dart';

var pagePath = [
  GetPage(
      name: "/authPage",
      page: () => const AuthPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/homePage",
      page: () => const HomePage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/chatPage",
      page: () => const ChatPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/profilePage",
      page: () => const ProfilePage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/contactPage",
      page: () => const ContactPage(),
      transition: Transition.rightToLeft),
];
