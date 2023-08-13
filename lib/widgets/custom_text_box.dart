import 'package:chat_application/constants.dart';
import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  const MyTextBox({super.key, this.text, this.sectionName, this.onPressed});
  final void Function()? onPressed;
  final String? text;
  final String? sectionName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sectionName!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: kPrimaryColorblack),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(text!),
            ),
            const SizedBox(
              height: 17,
            )
          ],
        ),
      ),
    );
  }
}
