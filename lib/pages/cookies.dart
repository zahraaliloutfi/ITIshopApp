import 'package:chat_application/constants.dart';
import 'package:chat_application/widgets/custom_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Cookies extends StatefulWidget {
  const Cookies({super.key});

  @override
  State<Cookies> createState() => _CookiesState();
}

class _CookiesState extends State<Cookies> {
  final currentUser = FirebaseAuth.instance.currentUser;

  final userCollection = FirebaseFirestore.instance.collection('Cookies');

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
          'COOKIES ',
          style:
              TextStyle(color: kPrimaryColorblack, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Cookies')
            .doc(currentUser?.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  MyCategory(
                    sizeImage: 7,
                    image: userData['image1'],
                    descripion: userData['description1'],
                    name: userData['dessertName1'],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  MyCategory(
                    sizeImage: 7,
                    descripion: userData['description2'],
                    name: userData['dessertName2'],
                    image: userData['image2'],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyCategory(
                    sizeImage: 7,
                    descripion: userData['description4'],
                    name: userData['dessartName4'],
                    image: userData['image4'],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  MyCategory(
                    sizeImage: 7,
                    descripion: userData['description5'],
                    name: userData['dessartName5'],
                    image: userData['image5'],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  MyCategory(
                    sizeImage: 7,
                    descripion: userData['description6'],
                    name: userData['dessartName6'],
                    image: userData['image6'],
                  ),
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
