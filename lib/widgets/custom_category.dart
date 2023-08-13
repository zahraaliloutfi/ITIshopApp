import 'package:chat_application/constants.dart';
import 'package:flutter/material.dart';

class MyCategory extends StatelessWidget {
  const MyCategory(
      {super.key,
      required this.image,
      required this.name,
      required this.descripion,
      required this.sizeImage});

  final String image;
  final String name;
  final String descripion;
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
              Padding(
                padding: const EdgeInsets.only(left: 13, bottom: 13, top: 13),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  descripion,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
