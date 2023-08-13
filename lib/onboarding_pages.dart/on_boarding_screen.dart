import 'package:chat_application/auth_pages/login_screen.dart';
import 'package:chat_application/auth_pages/sign_up_screen.dart';
import 'package:chat_application/constants.dart';
import 'package:chat_application/widgets/custom_button.dart';
import 'package:chat_application/widgets/custum_on_bourding_container.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;

  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      OnBoardingContainer(
          customButton1: Container(),
          customButton2: Container(),
          image: onBoardingimage1,
          text1: 'Taste Weekly',
          text2: '',
          text3: 'Whether you need dessert delivery*, curbside pickup, ',
          text4:
              'or something else, we make it easy to order cookies online and through the app',
          text5: '',
          index: 1,
          onPressed: () {
            int nextPage = controller.currentPage + 1;
            controller.animateToPage(page: nextPage);
          }),
      OnBoardingContainer(
        customButton1: Container(),
        customButton2: Container(),
        image: onBoardingimage2,
        text1: 'Apply to Work at a Crumbl Near You',
        text2: '',
        text3: 'JOIN THE CREW',
        text4: 'Shipping only available in the United States',
        text5: '',
        index: 2,
        onPressed: () => controller.jumpToPage(page: 2),
      ),
      OnBoardingContainer(
        customButton1: CustomButton(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ));
          },
          text: 'Sing Up',
          backGroundColor: kPrimaryColorOrange,
          textColor: kPrimaryColorWhite,
          height: 50,
          width: 150,
          outColor: kPrimaryColorOrange,
        ),
        customButton2: CustomButton(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
          },
          text: 'Log In',
          backGroundColor: kPrimaryColorWhite,
          textColor: kPrimaryColorOrange,
          height: 50,
          width: 150,
          outColor: kPrimaryColorOrange,
        ),
        image: onBoardingimage3,
        text1: 'Cookie flavors ',
        text4: '6 deliciously gourmet flavors to experience',
        text2: '',
        text3: 'Each week, our menu rotates to give you',
        text5: '',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            LiquidSwipe(
              onPageChangeCallback: OnPageChangeCallback,
              pages: pages,
              enableLoop: false,
              enableSideReveal: false,
              liquidController: controller,
              // slideIconWidget: Icon(Icons.arrow_back_ios),
              // enableSideReveal: true,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: controller.currentPage,
                      count: 3,
                      effect: WormEffect(
                        dotColor: kPrimaryColor,
                        activeDotColor: kPrimaryColorOrange,
                        dotHeight: 5,
                        dotWidth: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  OnPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
