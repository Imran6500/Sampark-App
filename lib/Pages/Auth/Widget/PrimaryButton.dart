import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback ontap;
  const PrimaryButton(
      {super.key,
      required this.ontap,
      required this.btnName,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              btnName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
