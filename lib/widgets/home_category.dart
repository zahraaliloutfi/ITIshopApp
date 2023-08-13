import 'package:chat_application/constants.dart';
import 'package:flutter/material.dart';

class ImageHome extends StatelessWidget {
  const ImageHome({
    super.key,
    required this.image,
    required this.sizeImage,
  });

  final String image;
  final double sizeImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColorWhite,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.network(
                image,
                scale: sizeImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
