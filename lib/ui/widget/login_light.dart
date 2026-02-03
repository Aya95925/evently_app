import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/model/user_dm.dart';
import 'package:evently_app/ui/util/app_assets.dart';
import 'package:evently_app/ui/util/app_color.dart';
import 'package:evently_app/ui/util/app_dialog.dart';
import 'package:evently_app/ui/util/app_style.dart';
import 'package:evently_app/ui/util/routes.dart';
import 'package:evently_app/ui/widget/custom_TextField.dart';
import 'package:evently_app/ui/widget/custom_container_evently.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginLight extends StatefulWidget {
  const LoginLight({super.key});

  @override
  State<LoginLight> createState() => _LoginLightState();
}

class _LoginLightState extends State<LoginLight> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.eventlyImg),
              SizedBox(height: 28),
              Text(
                appLocalizations.loginToYourAccount,
                style: AppStyle.blue24SemiBold,
              ),
              SizedBox(height: 24),
              CustomTextfield(
                controller: emailController,
                hintText: appLocalizations.enterYourEmail,
                prefixIcon: AppAssets.icEmailSvg,
              ),
              SizedBox(height: 16),
              CustomTextfield(
                controller: passwordController,
                hintText: appLocalizations.enterYourPassword,
                prefixIcon: AppAssets.icPasswordSvg,
                suffixIcon: AppAssets.eyeSlash,
              ),
              SizedBox(height: 8),

              Text(
                appLocalizations.forgetPassword,
                textAlign: TextAlign.end,
                style: AppStyle.blue16Medium.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColor.primaryBlue,
                  decorationThickness: 1.5,
                ),
              ),
              SizedBox(height: 47),
              buildLoginBottom(),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appLocalizations.dontHaveAnAccount,
                    style: AppStyle.grey16Regular,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, Routes.registerRoute);
                    },
                    child: Text(
                      appLocalizations.signup,
                      style: AppStyle.blue14SemiBold.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.primaryBlue,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Center(child: Text('Or', style: AppStyle.blue16Medium)),
              SizedBox(height: 24),
              CustomContainerEvently(
                onPressed: () async {
                  // await signInWithGoogle();
                },
                text: Text(
                  appLocalizations.loginWithGoogle,
                  style: AppStyle.blue18Medium,
                ),
                color: AppColor.textPrimaryDarkWhite,
                image: AppAssets.googleImg,
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomContainerEvently buildLoginBottom() {
    return CustomContainerEvently(
      onPressed: () async {
        try {
          if (emailController.text.isEmpty || passwordController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please enter email and password')),
            );
            return;
          }
          showLoading(context);
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              );
          await getUserFromFireStore(credential.user!.uid);
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User logged in successfully')),
          );

          await Future.delayed(const Duration(seconds: 1));
          Navigator.push(context, Routes.homeScreen);
        } on FirebaseAuthException catch (e) {
          Navigator.pop(context);
          String message = 'Registration failed. Please try again.';
          if (e.code == 'user-not-found') {
            message = 'No user found for that email.';
          } else if (e.code == 'wrong-password') {
            message = 'Wrong password provided for that user.';
          }
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        }
      },
      text: Text(
        AppLocalizations.of(context)!.login,
        style: AppStyle.white20Medium,
      ),
    );
  }

  Future<UserDm> getUserFromFireStore(String uId) async {
    var userCollection = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot snapShot = await userCollection.doc(uId).get();
    Map<String, dynamic> json = snapShot.data() as Map<String, dynamic>;
    UserDm.currentUser = UserDm.fromJson(json);
    return UserDm.currentUser!;
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
  //       .authenticate();

  //   if (googleUser == null) {
  //     throw Exception('User cancelled Google Sign-In');
  //   }

  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;

  //   final OAuthCredential credential = GoogleAuthProvider.credential(
  //     idToken: googleAuth.idToken,
  //   );

  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
