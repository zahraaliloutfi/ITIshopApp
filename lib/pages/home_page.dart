import 'package:chat_application/constants.dart';
import 'package:chat_application/widgets/home_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser;

  final userCollection = FirebaseFirestore.instance.collection('Category');

  Future<void> editField(String field) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorWhite,
      appBar: AppBar(
        backgroundColor: kPrimaryColorOrange,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'DESSERT SHOP',
          style:
              TextStyle(color: kPrimaryColorWhite, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Category')
            .doc(currentUser?.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data?.data()! as Map<String, dynamic>;
            return ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ImageHome(image: userData['image5'], sizeImage: 6),
                ImageHome(image: userData['image8'], sizeImage: 6),
                ImageHome(image: userData['image1'], sizeImage: 4),
                // ImageHome(image: userData['image10'], sizeImage: 6),
                // ImageHome(image: userData['image11'], sizeImage: 2),
                ImageHome(image: userData['image4'], sizeImage: 2),
                ImageHome(image: userData['image3'], sizeImage: 6),
                ImageHome(image: userData['image7'], sizeImage: 2),
                ImageHome(image: userData['image2'], sizeImage: 6),
              ],
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
