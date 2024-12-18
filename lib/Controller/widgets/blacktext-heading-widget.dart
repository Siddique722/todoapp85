import 'package:archi/Controller/constants/app-colors/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BlackTextHeading extends StatelessWidget {
  String text;
   BlackTextHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return   Text(text,style: GoogleFonts.poppins(
        color: AppColors.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w500
    ),);
  }
}
