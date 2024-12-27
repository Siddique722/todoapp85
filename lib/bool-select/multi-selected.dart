import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  int select=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              InkWell(
                onTap: (){
                  select=1;
                  setState(() {
            
                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color:
                  select==1?Colors.purple
                  :Colors.grey,
                ),
              ),
              InkWell(
                onTap: (){
                  select=2;
                  setState(() {
            
                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color:select==2?Colors.purple: Colors.grey,
                ),
              ),
            ],),
            select==1?
            Center(child: Text(
                'Chats'),):SizedBox(),
            select==2?
            Center(child: Text('Updates'),):SizedBox()
            
          ],
        ),
        
      ),
      
    );
  }
}
