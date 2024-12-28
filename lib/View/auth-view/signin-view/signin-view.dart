import 'package:archi/Controller/constants/app-loader/apploader.dart';
import 'package:archi/Controller/widgets/button-widget.dart';
import 'package:archi/container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            obscureText: true,
          ),
          isLoading
              ? AppLoader()
              : ButtonWidget(
                  text: 'Login',
                  ontap: () async {
                    isLoading = true;
                    setState(() {});
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text)
                        .then((onValue) {
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ContainerClass()));
                    }).onError((value, error) {});
                  })
        ],
      ),
    );
  }
}
