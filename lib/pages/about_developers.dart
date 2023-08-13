import 'package:chat_application/constants.dart';
import 'package:flutter/material.dart';

class AboutDev extends StatelessWidget {
  const AboutDev({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About the developer '),
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
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'ZAHRA ALI ABOUELKHEIR',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                      child: Text(
                        '''

Is a sofware developer , she is studies at Mansoura University Computer and Control Science Engineering Department ,she is 21 years old , she love software engineering and love computer science education 
''',
                        style: TextStyle(fontSize: 15),
                      ),
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
