import 'package:flutter/material.dart';
import 'package:sampark/Pages/Auth/Widget/PrimaryButton.dart';

class UserUpdateProfile extends StatelessWidget {
  const UserUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              // height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Icons.image,
                            size: 40,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Personal Info",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Row(
                          children: [
                            Text(
                              "Name",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Imran Hashmi"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Email id",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.alternate_email_outlined),
                              hintText: "abc123@gmail.com"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Phone Number",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: "9369066500"),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(
                                ontap: () {},
                                btnName: "Save",
                                icon: Icons.save),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
