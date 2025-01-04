import 'package:archi/Controller/constants/app-colors/app-colors.dart';
import 'package:archi/Controller/constants/app-loader/apploader.dart';
import 'package:archi/Controller/widgets/blacktext-heading-widget.dart';
import 'package:archi/Controller/widgets/button-widget.dart';
import 'package:archi/Controller/widgets/normat-text-widget.dart';
import 'package:archi/Controller/widgets/textformfield-widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateView extends StatefulWidget {
  String docid;
  UpdateView({super.key, required this.docid});

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  bool isLoading = false;
  updateData() async {
    try {
      await FirebaseFirestore.instance
          .collection('Test')
          .doc(widget.docid)
          .update({
        'studentName': nameController.text,
        'fatherName': fatherNameController.text
      });
      Navigator.pop(context);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlackTextHeading(text: 'Update Data'),
            SizedBox(
              height: 20,
            ),
            NormalTextWidget(
              text: 'Please fill in the details below.',
              textColor: AppColors.primaryColor,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormFieldWidget(
              hintText: 'Enter your Name',
              controller: nameController,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormFieldWidget(
              hintText: 'Enter your Father\'s Name',
              controller: fatherNameController,
            ),
            SizedBox(
              height: 30,
            ),
            isLoading == true
                ? AppLoader()
                : ButtonWidget(
                    text: 'Save Data',
                    ontap: () {
                      //   insertData();
                      // Perform save data logic here
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
