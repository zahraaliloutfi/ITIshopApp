import 'package:chat_application/constants.dart';
import 'package:chat_application/widgets/custom_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Donuts extends StatefulWidget {
  const Donuts({super.key});

  @override
  State<Donuts> createState() => _DonutsState();
}

class _DonutsState extends State<Donuts> {
  final currentUser = FirebaseAuth.instance.currentUser;

  final userCollection = FirebaseFirestore.instance.collection('Donuts');

  Future<void> editField(String field) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColorblack,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kPrimaryColorWhite,
        centerTitle: true,
        title: const Text(
          'DONUTS ',
          style:
              TextStyle(color: kPrimaryColorblack, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Donuts')
            .doc(currentUser?.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  Expanded(
                    child: MyCategory(
                      sizeImage: 2,
                      name: userData['dessartName1'],
                      descripion: userData['description1'],
                      image: userData['image1'],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: MyCategory(
                      sizeImage: 4,
                      name: userData['dessartName2'],
                      descripion: userData['description2'],
                      image: userData['image2'],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: MyCategory(
                      sizeImage: 2,
                      name: userData['dessartName3'],
                      descripion: userData['description3'],
                      image: userData['image3'],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: MyCategory(
                      sizeImage: 2,
                      name: userData['dessartName4'],
                      descripion: userData['description4'],
                      image: userData['image4'],
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // MyCategory(
                  //   name: 'donuts',
                  //   descripion:
                  //       'Donuts stuffed with chocolate and covered with chocolate on the outside',
                  //   image:
                  //       'https://cookingwithkarli.com/wp-content/uploads/2019/03/donuts-v-8-500x500.jpg',
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // MyCategory(
                  //   name: 'donuts',
                  //   descripion:
                  //       'Donuts stuffed with chocolate and covered with chocolate on the outside',
                  //   image:
                  //       'https://cookingwithkarli.com/wp-content/uploads/2019/03/donuts-v-8-500x500.jpg',
                  // ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
