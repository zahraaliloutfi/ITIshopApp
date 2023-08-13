import 'package:chat_application/auth_pages/sign_up_screen.dart';
import 'package:chat_application/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class onBoarding4 extends StatelessWidget {
  const onBoarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(onBoardingimage4),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ));
                    },
                    text: 'Teacher',
                    backGroundColor: kPrimaryColorOrange,
                    textColor: kPrimaryColorWhite,
                    height: 50,
                    width: 150,
                    outColor: kPrimaryColorOrange,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ));
                    },
                    text: 'Student',
                    backGroundColor: kPrimaryColorWhite,
                    textColor: kPrimaryColorOrange,
                    width: 150,
                    height: 50,
                    outColor: kPrimaryColorOrange,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: CustomButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ));
                },
                text: 'Skip for Now!',
                backGroundColor: kPrimaryColorOrange,
                textColor: kPrimaryColorWhite,
                width: 250,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                height: 50,
                outColor: kPrimaryColorOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
