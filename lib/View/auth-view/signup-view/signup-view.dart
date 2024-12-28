import 'package:archi/Controller/constants/app-colors/app-colors.dart';
import 'package:archi/Controller/constants/app-loader/apploader.dart';
import 'package:archi/Controller/widgets/blacktext-heading-widget.dart';
import 'package:archi/Controller/widgets/button-widget.dart';
import 'package:archi/Controller/widgets/normat-text-widget.dart';
import 'package:archi/Controller/widgets/textformfield-widget.dart';
import 'package:archi/View/auth-view/signin-view/signin-view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          BlackTextHeading(text: 'Welcome Onboard!'),
          SizedBox(
            height: 20,
          ),
          NormalTextWidget(
            text: 'Let’s help you meet up your task',
            textColor: AppColors.primaryColor,
          ),
          //   TextFormFieldWidget(hintText: 'Enter your Full Name', controller: fullNameController),
          TextFormFieldWidget(
              hintText: 'Enter your Email address ',
              controller: emailController),
          TextFormFieldWidget(
              hintText: 'Create a Password', controller: passwordController),
          // TextFormFieldWidget(hintText: 'Confirm your Password', controller: fullNameController),
          SizedBox(
            height: 10,
          ),
          isLoading
              ? AppLoader()
              : ButtonWidget(
                  text: 'SignUp',
                  ontap: () async {
                    isLoading = true;
                    setState(() {
                      //isLoading = false;
                    });
                    await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text)
                        .then((value) {
                      isLoading = false;
                      setState(() {});
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SigninView()));
                    }).onError((value, error) {
                      isLoading = false;
                      setState(() {});
                      Get.snackbar('Error', '${value.toString()}',
                          backgroundColor: AppColors.primaryColor);
                      print('Error: ' + value.toString());
                    });
                  }),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NormalTextWidget(
                  text: 'Already have an account ?',
                  textColor: AppColors.blackColor),
              SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () {
                    Get.to(() => SigninView());
                  },
                  child: NormalTextWidget(
                      text: 'Sign In', textColor: AppColors.primaryColor)),
            ],
          )
        ],
      ),
    );
  }
}
