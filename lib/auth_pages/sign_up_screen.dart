import 'package:chat_application/auth_pages/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../auth_helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static String id = 'SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

GlobalKey<FormState> formKey = GlobalKey();

class _SignUpPageState extends State<SignUpPage> {
  String? email;
  bool _isObscure = true;
  bool _isObscureIcon = true;
  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                color: kPrimaryColor,
                height: 120,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        ' Enter your details below & free sign up',
                        style: TextStyle(
                          fontSize: 10,
                          color: kPrimaryColorGrey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColorWhite,
                      borderRadius: BorderRadius.circular(17)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: formKey,
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Your email',
                              style: TextStyle(
                                color: kPrimaryColorGrey,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              obscureText: false,
                              onChanged: (String data) {
                                email = data;
                              },
                              hintText: 'Email',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'password',
                              style: TextStyle(color: kPrimaryColorGrey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              obscureText: _isObscure,
                              suffix: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kPrimaryColorGrey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                              onChanged: (data) {
                                password = data;
                              },
                              hintText: 'Password',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              backGroundColor: kPrimaryColorOrange,
                              height: 50,
                              fontSize: 19,
                              textColor: kPrimaryColorWhite,
                              outColor: kPrimaryColorOrange,
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  isLoading = true;
                                  setState(() {});
                                  try {
                                    UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                      email: email!,
                                      password: password!,
                                    );

                                    FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(userCredential.user?.email)
                                        .set({
                                      'username': email,
                                      'bio': 'empty bio',
                                      //add any additional fields
                                    });
                                    //---------------------------------------------------------------
                                    FirebaseFirestore.instance
                                        .collection('Category')
                                        .doc(userCredential.user?.email)
                                        .set({
                                      'image1':
                                          'https://th.bing.com/th/id/R.94c446e379c413644ea3f344e11eb70e?rik=aaATsL97jmNxAw&riu=http%3a%2f%2famerican-bagel-company.com%2fwp-content%2fuploads%2f2013%2f07%2fdonut-whitesugarice.png&ehk=G8X6PvdeEdMZjxJTIUXI9ryn2KzblS5M3tWwKu10lpg%3d&risl=&pid=ImgRaw&r=0',

                                      'description1': 'description  bbbbbbb',
                                      'dessartName1': 'empty zahra',

                                      'image2':
                                          'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/1453b5e9-128c-4fc3-b48d-24fd2c897930_Semi-SweetChocolateChunk_Aerial_Crumb_Tech_2.png',

                                      'description2': 'description  bbbbbbb',
                                      'dessartName2': 'empty zahra',

                                      'image3':
                                          'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/d45c322a-e212-4074-9622-ca0d04632372_BuckeyeBrownie_Aerial_Crumb_Tech.png',

                                      'description3': 'description  bbbbbbb',
                                      'dessartName3': 'empty zahra',

                                      //add any additional fields

                                      'image4':
                                          'https://www.dunkindonuts.com/content/dam/dd/img/menu-redesign/donuts/VanillaFrostedSprinklesDonut_570x570.png',

                                      'description4': 'description  bbbbbbb',
                                      'dessartName4': 'empty zahra',

                                      'image5':
                                          'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/51c75b4c-7374-47cf-90e5-3db0521cacf7_KentuckyButtercake_Aerial_Crumb_Tech_2.png',

                                      'description5': 'description  bbbbbbb',
                                      'dessartName5': 'empty zahra',

                                      'image7':
                                          'https://www.dunkindonuts.com/content/dam/dd/img/menu-redesign/donuts/5Munchkins_570x570.png',

                                      'description7': 'description  bbbbbbb',
                                      'dessartName7': 'empty zahra',

                                      'image10':
                                          'https://cookingwithkarli.com/wp-content/uploads/2019/03/donuts-v-8-500x500.jpg',

                                      'description10': 'description  bbbbbbb',
                                      'dessartName10': 'empty zahra',

                                      'image8':
                                          'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/9335d417-391f-4099-8f25-f1adc7cc355e_LemonBar_Aerial_Crumb_Tech.png',

                                      'description8': 'description  bbbbbbb',
                                      'dessartName8': 'empty zahra',

                                      'image11':
                                          'https://cookingwithkarli.com/wp-content/uploads/2019/03/donuts-v-8-500x500.jpg',

                                      'description11': 'description  bbbbbbb',
                                      'dessartName11': 'empty zahra',
                                    });
                                    FirebaseFirestore.instance
                                        .collection('Donuts')
                                        .doc(userCredential.user?.email)
                                        .set({
                                      'image1':
                                          'https://th.bing.com/th/id/OIP._4TuQpwddUfbMKFN38_feAHaHa?pid=ImgDet&rs=1',
                                      'dessartName1': 'chocolate donut',
                                      'description1':
                                          'chocolate sprinkles donut',

                                      'image2':
                                          'https://th.bing.com/th/id/R.94c446e379c413644ea3f344e11eb70e?rik=aaATsL97jmNxAw&riu=http%3a%2f%2famerican-bagel-company.com%2fwp-content%2fuploads%2f2013%2f07%2fdonut-whitesugarice.png&ehk=G8X6PvdeEdMZjxJTIUXI9ryn2KzblS5M3tWwKu10lpg%3d&risl=&pid=ImgRaw&r=0',
                                      'dessartName2': 'white donut',
                                      'description2':
                                          'donut with yummy white chocolate',

                                      'image3':
                                          'https://www.dunkindonuts.com/content/dam/dd/img/menu-redesign/donuts/VanillaFrostedSprinklesDonut_570x570.png',
                                      'dessartName3': 'Donut mix flavors',
                                      'description3':
                                          'Our delicious donuts come in a variety of flavors, so there’s a favorite for everyone',
                                      //add any additional fields
                                      'image4':
                                          'https://www.dunkindonuts.com/content/dam/dd/img/menu-redesign/donuts/5Munchkins_570x570.png',
                                      'description4':
                                          'They’re made in a variety of delicious flavors and free of artificial dyes, so it’s easy to try them all.',
                                      'dessartName4':
                                          'SHAREABLE, SNACKABLE PERFECTION',

                                      // 'image5':
                                      //     'https://cookingwithkarli.com/wp-content/uploads/2019/03/donuts-v-8-500x500.jpg',

                                      // 'description5': 'description  bbbbbbb',
                                      // 'dessartName5': 'empty zahra',

                                      // 'image6':
                                      //     'https://cookingwithkarli.com/wp-content/uploads/2019/03/donuts-v-8-500x500.jpg',

                                      // 'description6': 'description  bbbbbbb',
                                      // 'dessartName6': 'empty zahra',
                                      // 'description7': 'description  bbbbbbb',
                                      // 'dessartName7': 'empty zahra',

                                      // 'image8':
                                      //     'https://cookingwithkarli.com/wp-content/uploads/2019/03/donuts-v-8-500x500.jpg',

                                      // 'description8': 'description  bbbbbbb',
                                      // 'dessartName8': 'empty zahra',

                                      // 'image9':
                                      //     'https://cookingwithkarli.com/wp-content/uploads/2019/03/donuts-v-8-500x500.jpg',

                                      // 'description9': 'description  bbbbbbb',
                                      // 'dessartName9': 'empty zahra',
                                    });
                                    //--------------------------------------------------
                                    FirebaseFirestore.instance
                                        .collection('Cookies')
                                        .doc(userCredential.user?.email)
                                        .set({
                                      'image1':
                                          'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/1453b5e9-128c-4fc3-b48d-24fd2c897930_Semi-SweetChocolateChunk_Aerial_Crumb_Tech_2.png',
                                      'description1':
                                          'Chocolate chip, but make it chunky—a delicious cookie filled with irresistible semi-sweet chocolate chunks and a sprinkle of flaky sea salt.',
                                      'dessertName1':
                                          'Semi-Sweet Chocolate Chunk',

                                      'image2':
                                          'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/51c75b4c-7374-47cf-90e5-3db0521cacf7_KentuckyButtercake_Aerial_Crumb_Tech_2.png',
                                      'description2':
                                          'A yellow butter cake cookie smothered with a melt-in-your-mouth buttery glaze',
                                      'dessertName2': 'Kentucky Butter Cake',

                                      'image3':
                                          'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/cf860839-e7d9-4db9-ae1f-c689e11cb82a_PinkDoughnut_Aerial_Crumb_Tech.png',
                                      'description3':
                                          'A soft vanilla cookie topped with a pink glaze and a splash of rainbow sprinkles, with a hole just like a doughnut!',

                                      'dessertName3': 'Pink Doughnut',

                                      //add any additional fields

                                      'image4':
                                          'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/d45c322a-e212-4074-9622-ca0d04632372_BuckeyeBrownie_Aerial_Crumb_Tech.png',
                                      'description4':
                                          'A decadent treat with layers of chocolate brownie, peanut butter, and a smothering of melted semi-sweet chocolate.',
                                      'dessartName4': 'Buckeye Brownie',

                                      'image5':
                                          'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/c50b3dd6-f222-4407-bc2b-63ca4343cbf3_VanillaCrumbCakeFtGoldenOreo_Aerial_Crumb_Tech.jpg',
                                      'description5':
                                          'A warm cookie with GOLDEN OREO® cookie pieces, topped with a swirl of vanilla cream cheese frosting and GOLDEN OREO® cookie pieces. OREO® is a trademark of Mondelēz International group, used under license.',
                                      'dessartName5': 'Vanilla Crumb Cake',

                                      'image6':
                                          'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/9335d417-391f-4099-8f25-f1adc7cc355e_LemonBar_Aerial_Crumb_Tech.png',
                                      'description6': 'description  bbbbbbb',
                                      'dessartName6': 'Lemon Bar',

                                      // 'image10':
                                      //     'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/c50b3dd6-f222-4407-bc2b-63ca4343cbf3_VanillaCrumbCakeFtGoldenOreo_Aerial_Crumb_Tech.jpg',

                                      // 'description10': 'A zesty lemon cookie smothered with lemon bar topping and a dash of powdered sugar.',
                                      // 'dessartName10': 'empty zahra',

                                      // 'image8':
                                      //     'https://crumbl.video/cdn-cgi/image/width=1920,quality=80/https://crumbl.video/9335d417-391f-4099-8f25-f1adc7cc355e_LemonBar_Aerial_Crumb_Tech.png',

                                      // 'description8': 'description  bbbbbbb',
                                      // 'dessartName8': 'empty zahra',

                                      // 'image11':
                                      //     'https://th.bing.com/th/id/OIP._4TuQpwddUfbMKFN38_feAHaHa?pid=ImgDet&rs=1',

                                      // 'description11': 'description  bbbbbbb',
                                      // 'dessartName11': 'empty zahra',
                                    });

                                    //-----------------------------------------------------------------------------
                                    showSnackBar(context, 'Success');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage(),
                                        ));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      showSnackBar(context, 'weak password');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      showSnackBar(
                                          context, 'email is already exsist');
                                    }
                                  } catch (e) {
                                    showSnackBar(
                                        context, 'errorrrrrrrrrrrrrrrrr');
                                  }
                                  isLoading = false;
                                  setState(() {});
                                } else {}
                              },
                              text: 'Sign Up',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      _isObscureIcon
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                      color: kPrimaryColorGrey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscureIcon = !_isObscureIcon;
                                      });
                                    }),
                                const Text(
                                  """By creating an account you have to agree
      with our them & condication.""",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: kPrimaryColorGrey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'don\'t have an account ? ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: kPrimaryColorGrey,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'log in',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: kPrimaryColorOrange,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> registerUser() async
  //     UserCredential userCredential =
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: email!,
  //     password: password!,
  //   );
}
