import 'package:archi/Controller/constants/app-colors/app-colors.dart';
import 'package:flutter/material.dart';


class TextFormFieldWidget extends StatelessWidget {
  String hintText;
  TextEditingController controller;
   TextFormFieldWidget({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(11)
        ),
        child: TextFormField(
          controller:controller ,
          decoration: InputDecoration(
              hintText:hintText,
            border: InputBorder.none
          ),
        ),
      ),
    )
    ;
  }
}
