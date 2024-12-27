import 'package:archi/Controller/constants/app-colors/app-colors.dart';
import 'package:archi/Controller/constants/app-images/app-images.dart';
import 'package:archi/Controller/constants/app-loader/apploader.dart';
import 'package:archi/Controller/widgets/blacktext-heading-widget.dart';
import 'package:archi/Controller/widgets/button-widget.dart';
import 'package:archi/Controller/widgets/image-widget.dart';
import 'package:archi/View/auth-view/signup-view/signup-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // nitial state function
  //  @override
  //  void initState() {
  //    // TODO: implement initState
  //    super.initState();
  //    Future.delayed(Duration(seconds: 3),(){
  //      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupView()));
  //    });
  //  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor, //Color(0xff55847A),
      body: Center(
        child: Column(
          children: [
            // Image(image:
            // AssetImage(AppImages.splashImg),
            // height: 254,
            // ),
            SizedBox(
              height: 50,
            ),
            ImageWidget(image: AppImages.splashImg),
            SizedBox(
              height: 10,
            ),
            BlackTextHeading(text: 'Get things done with TODo'),
            SizedBox(
              height: 30,
            ),
            // CircularProgressIndicator(
            //   //backgroundColor: AppColors.primaryColor,
            //   color: AppColors.primaryColor,
            // ),
            // SpinKitCircle(
            //   color: AppColors.primaryColor,
            // ),
            // SpinKitWave(
            //   color: AppColors.primaryColor,
            // ),
            AppLoader(),

            ButtonWidget(
                text: 'Get Started',
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupView()));
                })
          ],
        ),
      ),
    );
  }
}
