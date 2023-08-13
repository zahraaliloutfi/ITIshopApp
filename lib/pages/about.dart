import 'package:chat_application/constants.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About'),
          backgroundColor: kPrimaryColorOrange,
        ),
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColorWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '''The Shop App is essentially Shopify’s shopping app for consumers. The mobile app provides a convenient environment where customers can speed through the checkout process, check out products, and see recommendations too.
                                  
Since COVID-19 accelerated the increasing desire to spend more time online, rather than shopping in person, apps like these are becoming increasingly popular. Those interested in mobile shopping can now learn more about the brands that they want to buy from and buy items with a single click from their mobile or iPhone.
                                  
 Shopify announced that the Shop App is a response to an increasing transformation in the digital landscape. Customers are now moving not just from desktop computers to increasingly mobile commerce. Today’s buyers also want to use more native mobile apps, rather than relying on their web browsers.
                                  
 According to Shopify, since most customers only download a handful of apps, it’s hard for most companies to convince their clients to download a dedicated app for their store. However, with Shopify’s Shop App, customers can have access to all the stores they want on their Apple or Android device. contrast to a lot of the shopping tools available that often introduce customers to new products from brands that they don’t really know or care about.
                                  
What Can Shop App Do?

The Shop App is real-time buying and browsing experience for customers in the United States.

Similar to shopping on Amazon, customers get a huge selection of products from different vendors to browse through. The Shop digital assistant combines all of the leading features of the Arrive app for tracking parcels, and Shop Pay. This means that customers can get push notifications on trending products, and speed through their checkout process too.

The idea is that this mobile commerce platform will give local businesses and online businesses a better way to sell more products. At the same time, customers get an improved shopping experience where everything feels streamlined and convenient.

The Shop App takes care of everything, from tracking deliveries to handling gift cards. When customers have a better shopping experience, they’re more likely to buy online.

Shop provides customized shopping recommendations for each customer too. These recommendations are designed based on the brands that customers have already shown interest in. If you’ve purchased from a Shopify shop before, or followed a company’s profile in the app, then you’ll see recommendations from that company.

The unique way that the Shop App recommends products means that customers get a more relevant experience. This is in contrast to a lot of the shopping tools available that often introduce customers to new products from brands that they don’t really know or care about.

'''),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
