import 'package:chat_application/constants.dart';
import 'package:chat_application/pages/about.dart';
import 'package:chat_application/pages/about_developers.dart';
import 'package:chat_application/widgets/custom_text_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;

  final userCollection = FirebaseFirestore.instance.collection('Users');

  Future<void> editField(String field) async {
    String newValue = '';
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: kPrimaryColorWhite,
        title: Text(
          'Edit $field',
          style: const TextStyle(color: Colors.black),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: 'enter your $field',
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          onChanged: (value) => newValue = value,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: kPrimaryColorOrange),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(newValue);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: kPrimaryColorOrange),
            ),
          ),
        ],
      ),
    );

    if (newValue.trim().isNotEmpty) {
      await userCollection
          .doc(
        currentUser!.email,
      )
          .update({
        field: newValue,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorWhite,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColorOrange,
        title: const Text('Profile Screen'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser?.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 90,
                    child: Image.asset(
                      profileImage,
                    ),
                  ),
                  const Text(
                    'My Details :',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  MyTextBox(
                      text: currentUser!.email!,
                      sectionName: 'Email Address :'),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextBox(
                    sectionName: 'User name',
                    text: userData['username'].split('@')[0],
                    onPressed: () => editField('username'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextBox(
                    sectionName: 'User bio',
                    text: userData['bio'],
                    onPressed: () => editField('bio'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const About(),
                                ),
                              );
                            },
                            child: const Text(
                              'About',
                              style: TextStyle(color: kPrimaryColorOrange),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AboutDev(),
                                ),
                              );
                            },
                            child: const Text(
                              'About DEVELOPERS',
                              style: TextStyle(color: kPrimaryColorOrange),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
