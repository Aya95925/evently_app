import 'package:evently_app/firebase_utils/fireBase_utils.dart';
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

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.eventlyImg),
                SizedBox(height: 28),
                Text('Create your account', style: AppStyle.blue24SemiBold),
                SizedBox(height: 24),
                CustomTextfield(
                  controller: nameController,
                  hintText: 'Enter your name',
                  prefixIcon: AppAssets.icUserSvg,
                ),
                SizedBox(height: 16),
                CustomTextfield(
                  controller: addressController,
                  hintText: 'Enter your address',
                  prefixIcon: AppAssets.icUserSvg,
                ),
                SizedBox(height: 16),
                CustomTextfield(
                  controller: phoneNumberController,
                  hintText: 'Enter your phone number',
                  prefixIcon: AppAssets.icUserSvg,
                ),
                SizedBox(height: 16),
                CustomTextfield(
                  hintText: 'Enter your email',
                  controller: emailController,
                  prefixIcon: AppAssets.icEmailSvg,
                ),
                SizedBox(height: 16),

                CustomTextfield(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  prefixIcon: AppAssets.icPasswordSvg,
                  suffixIcon: AppAssets.eyeSlash,
                ),
                SizedBox(height: 8),
                CustomTextfield(
                  hintText: 'Confirm your password',
                  prefixIcon: AppAssets.icPasswordSvg,
                  suffixIcon: AppAssets.eyeSlash,
                ),
                SizedBox(height: 8),
                SizedBox(height: 47),
                buildRegisterBottom(),
                SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: AppStyle.grey16Regular,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, Routes.loginRoute);
                      },
                      child: Text(
                        ' login',
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
                  onPressed: () {
                    Navigator.push(context, Routes.loginRoute);
                  },

                  text: Text(
                    'Sign Up With Google',
                    style: AppStyle.blue18Medium,
                  ),
                  color: AppColor.textPrimaryDarkWhite,
                  image: AppAssets.googleImg,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomContainerEvently buildRegisterBottom() {
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
              .createUserWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              );
          Navigator.pop(context);

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('User created successfully')));
          UserDm.currentUser = UserDm(
            id: credential.user!.uid,
            name: nameController.text,
            password: passwordController.text,
            email: emailController.text,
            phoneNumber: phoneNumberController.text,
            address: addressController.text,
          );
          createUserInFireStore(UserDm.currentUser!);

          await Future.delayed(const Duration(seconds: 1));
          Navigator.push(context, Routes.homeScreen);
        } on FirebaseAuthException catch (e) {
          Navigator.pop(context);
          String message;
          if (e.code == 'weak-password') {
            message = 'The password provided is too weak.';
          } else if (e.code == 'email-already-in-use') {
            message = 'The account already exists for that email.';
          } else {
            message = 'Registration failed. Try again.';
          }

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        } catch (e) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred. Please try again.')),
          );
        }
      },
      text: Text('Sign Up', style: AppStyle.white20Medium),
    );
  }
}
