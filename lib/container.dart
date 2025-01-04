import 'package:archi/Controller/constants/app-colors/app-colors.dart';
import 'package:archi/Controller/constants/app-icons/app-icons.dart';
import 'package:archi/View/auth-view/signup-view/signup-view.dart';
import 'package:archi/View/home-view/insert-view/insert-view.dart';
import 'package:archi/View/home-view/update-view/update-view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerClass extends StatelessWidget {
  const ContainerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoDialogRoute(
                    builder: (context) => InsertDataScreen(),
                    context: context));
          },
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.add,
            color: AppColors.whiteColor,
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  color: AppColors.primaryColor,
                ),
                Container(
                  child: Expanded(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection(FirebaseAuth.instance.currentUser!.uid)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        final data = snapshot.data!.docs;
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoDialogRoute(
                                          builder: (context) => UpdateView(
                                                docid: data[index]['docid'],
                                              ),
                                          context: context));
                                },
                                onLongPress: () async {
                                  await FirebaseFirestore.instance
                                      .collection('Test')
                                      .doc(data[index]['docid'])
                                      .delete();
                                },
                                title: Text(data[index]['studentName']),
                                subtitle: Text(data[index]['fatherName']),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    //topRight: Radius.circular(200),
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                    //topLeft: Radius.circular(10)
                  )),
            ),
            Container(
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(200),
                      bottomRight: Radius.circular(200))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 20, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ImageIcon(
                      AssetImage(AppIcons.backArrowIcon),
                      size: 50,
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => SignupView()));
                      },
                      icon: Icon(Icons.logout))
                ],
              ),
            )
          ],
        ));
  }
}
