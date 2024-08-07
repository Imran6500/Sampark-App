import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/Pages/Auth/Widget/LoginForm.dart';
import 'package:sampark/Pages/Auth/Widget/SignupForm.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = true.obs;
    return Container(
      padding: const EdgeInsets.all(20),
      // height: 400,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          isLogin.value = true;
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.bodyLarge
                                    : Theme.of(context).textTheme.labelLarge,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              AnimatedContainer(
                                duration: const Duration(microseconds: 200),
                                height: 3,
                                width: isLogin.value ? 100 : 0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isLogin.value = false;
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: Column(
                            children: [
                              Text(
                                "Signup",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.labelLarge
                                    : Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: isLogin.value ? 0 : 100,
                                height: 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return isLogin.value ? const LoginForm() : const SignupForm();
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
